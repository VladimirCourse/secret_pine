import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:nearby_connections/nearby_connections.dart';
import 'package:path_provider/path_provider.dart';
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
  Box<String>? _imageBox;

  String? _tempFileUri;

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
    _imageBox = await Hive.openBox('image');

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
    await _imageBox?.close();

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
              } catch (ex) {
                print(ex);
              }
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
                } catch (ex) {
                  print(ex);
                }

                await _nearby.copyFileAndDeleteOriginal(_tempFileUri!, await _lastImageUri);

                _tempFileUri = null;
              }
            } catch (ex) {
              print(ex);
              //
            }
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
      // final lastImage = _imageBox?.get('last_image');
      // final dir = await getExternalStorageDirectory();

      await _nearby.sendFilePayload(id, await _lastImageUri);
    } catch (ex) {
      print(ex);
    }
  }
}
