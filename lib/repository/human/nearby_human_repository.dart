import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:nearby_connections/nearby_connections.dart';
import 'package:rxdart/rxdart.dart';
import 'package:secret_pine/model/data_event_model.dart';
import 'package:secret_pine/model/device_event_model.dart';
import 'package:secret_pine/model/device_model.dart';
import 'package:secret_pine/repository/constants.dart';
import 'package:secret_pine/repository/human/human_repository.dart';

class NearbyHumanRepository extends HumanRepository {
  final _nearby = Nearby();

  String? _pineId;
  ConnectionInfo? _pineConnection;

  final _devicesSubject = BehaviorSubject<DeviceEventModel>();
  final _dataSubject = BehaviorSubject<DataEventModel>();

  NearbyHumanRepository({required this.userName});

  @override
  bool get isConnected => _pineConnection != null;

  @override
  Stream<DeviceEventModel> get devicesStream => _devicesSubject.stream;

  @override
  Stream<DataEventModel> get dataStream => _dataSubject.stream;

  @override
  final String userName;

  @override
  Future<void> start() async {
    await _discoverNearby();
  }

  @override
  Future<void> sendMessage(String message) async {
    if (_pineId != null) {
      final encrypted = Uint8List.fromList(utf8.encode('${Constants.createMessage}$message'));
      await _nearby.sendBytesPayload(_pineId!, encrypted);
    }
  }

  @override
  Future<void> sendImage(String filePath) async {
    if (_pineId != null) {
      await _nearby.sendFilePayload(_pineId!, filePath);
    }
  }

  @override
  Future<void> sendImageRequest() async {
    if (_pineId != null) {
      final encrypted = Uint8List.fromList(utf8.encode(Constants.getImage));
      await _nearby.sendBytesPayload(_pineId!, encrypted);
    }
  }

  @override
  Future<void> sendMessagesRequest() async {
    if (_pineId != null) {
      final encrypted = Uint8List.fromList(utf8.encode(Constants.getMessages));
      await _nearby.sendBytesPayload(_pineId!, encrypted);
    }
  }

  @override
  Future<void> stop() async {
    await _nearby.stopDiscovery();
    await _nearby.stopAllEndpoints();
    await _nearby.stopAdvertising();

    _dataSubject.add(const DataEventModel.messages(messages: []));
  }

  @override
  Future<void> close() async {
    await stop();

    await _devicesSubject.close();
    await _dataSubject.close();
  }

  Future<void> _discoverNearby() async {
    try {
      await _nearby.startDiscovery(
        userName,
        Strategy.P2P_POINT_TO_POINT,
        serviceId: Constants.channel,
        onEndpointFound: (id, name, serviceId) {
          if (name == Constants.pine && _pineConnection == null) {
            _nearby.requestConnection(
              userName,
              id,
              onConnectionInitiated: _acceptConnection,
              onConnectionResult: (id, status) {
                if (status == Status.CONNECTED && _pineConnection != null) {
                  _devicesSubject.add(
                    DeviceEventModel.connected(
                      device: DeviceModel(id: id, name: _pineConnection!.endpointName),
                    ),
                  );
                }
              },
              onDisconnected: (id) {
                if (_pineConnection != null) {
                  _devicesSubject.add(
                    DeviceEventModel.disconnected(
                      device: DeviceModel(id: id, name: _pineConnection!.endpointName),
                    ),
                  );
                }

                _pineConnection = null;
                _pineId = null;
              },
            );
          }
        },
        onEndpointLost: (id) {
          if (id != null && _pineConnection != null) {
            _devicesSubject.add(
              DeviceEventModel.disconnected(
                device: DeviceModel(id: id, name: _pineConnection!.endpointName),
              ),
            );
          }

          _pineConnection = null;
          _pineId = null;
        },
      );
    } catch (ex) {
      print(ex);
    }
  }

  Future<void> _acceptConnection(String id, ConnectionInfo info) async {
    try {
      if (_pineId == null || _pineConnection == null) {
        await _nearby.acceptConnection(
          id,
          onPayLoadRecieved: (id, payload) async {
            final bytes = payload.bytes;
            if (payload.type == PayloadType.BYTES && bytes != null) {
              try {
                final data = utf8.decode(Uint8List.fromList(bytes));
                if (data.startsWith(Constants.getMessages)) {
                  final messages = data.substring(Constants.getMessages.length).split(Constants.delimiter);

                  _dataSubject.add(DataEventModel.messages(messages: messages));
                }
              } catch (ex) {}
            } else if (payload.type == PayloadType.FILE) {}
          },
          onPayloadTransferUpdate: (id, payloadTransferUpdate) {},
        );

        _pineConnection = info;
        _pineId = id;
      }
    } catch (ex) {}
  }
}
