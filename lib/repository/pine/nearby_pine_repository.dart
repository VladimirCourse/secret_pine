import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
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

                if (data.startsWith(Constants.getMessages)) {
                  await _sendMessages(id);
                } else if (data.startsWith(Constants.getImage)) {
                } else if (data.startsWith(Constants.createMessage)) {
                  final message = data.substring(Constants.createMessage.length).replaceAll(Constants.delimiter, '');
                  final date = DateFormat('dd.MM.yyyy HH:mm').format(DateTime.now());

                  await _messageBox?.add('($date) ${_devices[id]!.name}: $message');

                  for (final id in _endpoints.keys) {
                    await _sendMessages(id);
                  }
                }
              } catch (ex) {
                print(ex);
              }
            } else if (payload.type == PayloadType.FILE) {}
          }
        },
        onPayloadTransferUpdate: (id, payloadTransferUpdate) {},
      );
      print('connected');
      _endpoints[id] = info;
      _devices[id] = DeviceModel(id: id, name: info.endpointName);
    } catch (ex) {
      _endpoints.remove(id);
    }
  }

  Future<void> _sendMessages(String id) async {
    final messages = _messageBox?.values.toList().reversed.take(10).join(Constants.delimiter);
    final encrypted = Uint8List.fromList(utf8.encode('${Constants.getMessages}$messages'));

    await _nearby.sendBytesPayload(id, encrypted);
  }
}
