import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:hive/hive.dart';
import 'package:mock_data/mock_data.dart';
import 'package:nearby_connections/nearby_connections.dart';
import 'package:secret_pine/model/data_event_model.dart';
import 'package:secret_pine/model/device_event_model.dart';
import 'package:secret_pine/model/device_model.dart';
import 'package:secret_pine/repository/transmit/transmit_repository.dart';
import 'package:rxdart/rxdart.dart';

class NearbyTransmitRepository extends TransmitRepository {
  static const channel = 'vl.secret_pine.yandex';

  final _nearby = Nearby();

  final Map<String, ConnectionInfo> _endpoints = {};
  final Map<String, DeviceModel> _devices = {};

  final _devicesSubject = BehaviorSubject<DeviceEventModel>();
  final _dataSubject = BehaviorSubject<DataEventModel>();

  TransmitMode _mode = TransmitMode.human;
  String _userName = '';
  Box<String>? _messageBox;

  @override
  TransmitMode get mode => _mode;

  @override
  List<DeviceModel> get devices => _devices.values.toList();

  @override
  Stream<DeviceEventModel> get devicesStream => _devicesSubject.stream;

  @override
  Stream<DataEventModel> get dataStream => _dataSubject.stream;

  @override
  String get userName => _userName;

  @override
  Future<void> start(TransmitMode mode) async {
    _userName = _generateUserName();
    _mode = mode;
    _messageBox = await Hive.openBox('messages');

    await _advertiseNearby();

    if (mode == TransmitMode.human) {
      await _discoverNearby();
    }
  }

  @override
  Future<void> sendMessage(String message) async {
    final encrypted = Uint8List.fromList(utf8.encode(message));
    for (final endpoint in _endpoints.keys) {
      await _nearby.sendBytesPayload(endpoint, encrypted);
    }
  }

  @override
  Future<void> sendFile(String filePath) async {
    for (final endpoint in _endpoints.keys) {
      await _nearby.sendFilePayload(endpoint, filePath);
    }
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

  String _generateUserName() => mode == TransmitMode.human ? '${mockName()} ${mockUUID().substring(32)}' : 'Pine';

  Future<void> _advertiseNearby() async {
    await _nearby.startAdvertising(
      userName,
      Strategy.P2P_POINT_TO_POINT,
      serviceId: channel,
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

  Future<void> _discoverNearby() async {
    try {
      await _nearby.startDiscovery(
        userName,
        Strategy.P2P_POINT_TO_POINT,
        serviceId: channel,
        onEndpointFound: (id, name, serviceId) {
          if (name == 'Pine') {
            _nearby.requestConnection(
              userName,
              id,
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
        },
        onEndpointLost: (id) {
          if (_devices.containsKey(id)) {
            _devicesSubject.add(DeviceEventModel.disconnected(device: _devices[id]!));
          }

          _endpoints.remove(id);
          _devices.remove(id);
        },
      );
    } catch (ex) {
      print(ex);
    }
  }

  Future<void> _acceptConnection(String id, ConnectionInfo info) async {
    try {
      await _nearby.acceptConnection(
        id,
        onPayLoadRecieved: (id, payload) async {
          final bytes = payload.bytes;
          if (payload.type == PayloadType.BYTES && bytes != null) {
            if (_devices.containsKey(id)) {
              try {
                final message = utf8.decode(Uint8List.fromList(bytes));
                await _messageBox?.add('(${DateTime.now().toIso8601String()}) ${_devices[id]!.name}: $message');
                // if (msg == 'start') {
                //   _devices[id] = _devices[id]!.copyWith(isTransmitting: true);
                //   _dataSubject.add(DataEventModel.startAudio(device: _devices[id]!));
                // } else if (msg == 'stop') {
                //   _devices[id] = _devices[id]!.copyWith(isTransmitting: false);
                //   _dataSubject.add(DataEventModel.stopAudio(device: _devices[id]!));
                // }
              } catch (ex) {
                _dataSubject.add(DataEventModel.audioData(device: _devices[id]!, data: payload.bytes!));
              }
            }
          } else if (payload.type == PayloadType.FILE) {}
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
