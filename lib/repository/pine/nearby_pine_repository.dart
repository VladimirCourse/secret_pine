import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:hive/hive.dart';
import 'package:nearby_connections/nearby_connections.dart';
import 'package:rxdart/rxdart.dart';
import 'package:secret_pine/model/data_event_model.dart';
import 'package:secret_pine/model/device_event_model.dart';
import 'package:secret_pine/model/device_model.dart';
import 'package:secret_pine/repository/constants.dart';
import 'package:secret_pine/repository/pine/pine_repository.dart';

class NearbyPineRepository extends PineRepository {
  final _nearby = Nearby();

  final Map<String, ConnectionInfo> _endpoints = {};
  final Map<String, DeviceModel> _devices = {};

  final _devicesSubject = BehaviorSubject<DeviceEventModel>();
  final _dataSubject = BehaviorSubject<DataEventModel>();

  Box<String>? _messageBox;

  // @override
  // List<DeviceModel> get devices => _devices.values.toList();

  // @override
  // Stream<DeviceEventModel> get devicesStream => _devicesSubject.stream;

  // @override
  // Stream<DataEventModel> get dataStream => _dataSubject.stream;

  @override
  final String userName = Constants.pine;

  @override
  Future<void> start() async {
    _messageBox = await Hive.openBox('messages');

    await _advertiseNearby();
  }

  @override
  Future<void> stop() async {
    await _nearby.stopDiscovery();
    await _nearby.stopAllEndpoints();
    await _nearby.stopAdvertising();
  }

  @override
  Future<void> close() async {
    await stop();

    await _messageBox?.close();

    await _devicesSubject.close();
    await _dataSubject.close();
  }

  Future<void> _advertiseNearby() async {
    await _nearby.startAdvertising(
      userName,
      Strategy.P2P_POINT_TO_POINT,
      serviceId: Constants.channel,
      onConnectionInitiated: _acceptConnection,
      onConnectionResult: (id, status) {
        if (_devices.containsKey(id)) {
          _devicesSubject.add(DeviceEventModel.connected(device: _devices[id]!));
        }
      },
      onDisconnected: (id) {
        if (_devices.containsKey(id)) {
          _devicesSubject.add(DeviceEventModel.disconnected(device: _devices[id]!));
        }

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
                if (data.startsWith(Constants.message)) {
                  final message = data.substring(Constants.message.length).replaceAll(Constants.delimiter, '');

                  await _messageBox?.add('(${DateTime.now().toIso8601String()}) ${_devices[id]!.name}: $message');
                } else if (data.startsWith(Constants.messages)) {
                  final messages = _messageBox?.values.toList().reversed.take(10).join(Constants.delimiter);
                  final encrypted = Uint8List.fromList(utf8.encode('${Constants.messages}$messages'));

                  await _nearby.sendBytesPayload(id, encrypted);
                } else if (data.startsWith(Constants.image)) {}
              } catch (ex) {}
            } else if (payload.type == PayloadType.FILE) {}
          }
        },
        onPayloadTransferUpdate: (id, payloadTransferUpdate) {},
      );

      _endpoints[id] = info;
      _devices[id] = DeviceModel(id: id, name: info.endpointName, isTransmitting: false);
    } catch (ex) {
      _endpoints.remove(id);
    }
  }
}
