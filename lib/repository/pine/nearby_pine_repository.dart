import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_ble_peripheral/flutter_ble_peripheral.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:nearby_connections/nearby_connections.dart';
import 'package:path_provider/path_provider.dart';
import 'package:secret_pine/model/device_model.dart';
import 'package:secret_pine/repository/constants.dart';
import 'package:secret_pine/repository/pine/pine_repository.dart';

class NearbyPineRepository extends PineRepository {
  final _blePeripheral = FlutterBlePeripheral();

  late final _advertiseData = AdvertiseData(
    serviceUuid: Constants.serviceId,
    includePowerLevel: true,
  );

  final _advertiseSettings = AdvertiseSettings(
    advertiseMode: AdvertiseMode.advertiseModeBalanced,
    txPowerLevel: AdvertiseTxPower.advertiseTxPowerHigh,
    timeout: 0,
    connectable: true,
  );

  final _nearby = Nearby();

  final Map<String, ConnectionInfo> _endpoints = {};
  final Map<String, DeviceModel> _devices = {};

  Box<String>? _messageBox;
  String? _tempFileUri;

  @override
  final String userName = Constants.pine;

  @override
  Future<void> start() async {
    _messageBox = await Hive.openBox('messages');

    await _advertiseNearby();

    if (!await _blePeripheral.isAdvertising) {
      await _blePeripheral.start(
        advertiseData: _advertiseData,
        advertiseSettings: _advertiseSettings,
      );
    }
  }

  @override
  Future<void> stop() async {
    await _nearby.stopDiscovery();
    await _nearby.stopAllEndpoints();
    await _nearby.stopAdvertising();

    if (await _blePeripheral.isAdvertising) {
      await _blePeripheral.stop();
    }
  }

  @override
  Future<void> close() async {
    await stop();

    await _messageBox?.close();
  }

  Future<void> _advertiseNearby() async {
    await _nearby.startAdvertising(
      userName,
      Strategy.P2P_POINT_TO_POINT,
      serviceId: Constants.channel,
      onConnectionInitiated: _acceptConnection,
      onConnectionResult: (id, status) {},
      onDisconnected: (id) {
        _endpoints.remove(id);
        _devices.remove(id);
      },
    );
  }

  Future<void> _acceptConnection(String id, ConnectionInfo info) async {
    try {
      await _nearby.acceptConnection(
        id,
        onPayLoadRecieved: (id, payload) async {
          if (_devices.containsKey(id)) {
            final bytes = payload.bytes;

            if (payload.type == PayloadType.BYTES && bytes != null) {
              try {
                final data = utf8.decode(Uint8List.fromList(bytes));

                if (data.startsWith(Constants.getMessages)) {
                  await _sendMessages(id);
                } else if (data.startsWith(Constants.getImage)) {
                  await _sendImage(id);
                } else if (data.startsWith(Constants.createMessage)) {
                  await _saveMessage(id, data);
                  for (final id in _endpoints.keys) {
                    await _sendMessages(id);
                  }
                }
              } catch (ex) {}
            } else if (payload.type == PayloadType.FILE && payload.uri != null) {
              _tempFileUri = payload.uri;
            }
          }
        },
        onPayloadTransferUpdate: (id, payloadTransferUpdate) async {
          if (payloadTransferUpdate.status == PayloadStatus.SUCCESS) {
            try {
              if (_tempFileUri != null) {
                final lastImagePath = await _lastImageUri;

                try {
                  final file = File(lastImagePath);
                  await file.delete();
                } catch (ex) {}

                await _nearby.copyFileAndDeleteOriginal(_tempFileUri!, await _lastImageUri);

                for (final id in _endpoints.keys) {
                  await _sendImage(id);
                }

                _tempFileUri = null;
              }
            } catch (ex) {}
          }
        },
      );

      _endpoints[id] = info;
      _devices[id] = DeviceModel(id: id, name: info.endpointName);
    } catch (ex) {
      _endpoints.remove(id);
    }
  }

  Future<String> get _lastImageUri async => '${(await getExternalStorageDirectory())!.absolute.path}/last_pine_img';

  Future<void> _saveMessage(String id, String data) async {
    final message = data.substring(Constants.createMessage.length).replaceAll(Constants.delimiter, '');
    final date = DateFormat('dd.MM.yyyy HH:mm').format(DateTime.now());

    await _messageBox?.add('($date) ${_devices[id]!.name}: $message');
  }

  Future<void> _sendMessages(String id) async {
    final messages = _messageBox?.values.toList().reversed.take(10).join(Constants.delimiter);
    final encrypted = Uint8List.fromList(utf8.encode('${Constants.getMessages}$messages'));

    await _nearby.sendBytesPayload(id, encrypted);
  }

  Future<void> _sendImage(String id) async {
    try {
      await _nearby.sendFilePayload(id, await _lastImageUri);
    } catch (ex) {}
  }
}
