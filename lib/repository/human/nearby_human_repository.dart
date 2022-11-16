import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:hive/hive.dart';
import 'package:mock_data/mock_data.dart';
import 'package:nearby_connections/nearby_connections.dart';
import 'package:secret_pine/model/data_event_model.dart';
import 'package:secret_pine/model/device_event_model.dart';
import 'package:secret_pine/model/device_model.dart';
import 'package:secret_pine/repository/constants.dart';
import 'package:secret_pine/repository/human/human_repository.dart';
import 'package:rxdart/rxdart.dart';

class NearbyHumanRepository extends HumanRepository {
  final _nearby = Nearby();

  String? _pineId;
  ConnectionInfo? _pineConnection;

  final _devicesSubject = BehaviorSubject<DeviceEventModel>();
  final _dataSubject = BehaviorSubject<DataEventModel>();

  @override
  Stream<DeviceEventModel> get devicesStream => _devicesSubject.stream;

  @override
  Stream<DataEventModel> get dataStream => _dataSubject.stream;

  @override
  final String userName = '${mockName()} ${mockUUID().substring(32)}';

  @override
  Future<void> start() async {
    await _discoverNearby();
  }

  @override
  Future<void> sendMessage(String message) async {
    if (_pineId != null) {
      final encrypted = Uint8List.fromList(utf8.encode('${Constants.message}$message'));
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
      final encrypted = Uint8List.fromList(utf8.encode(Constants.image));
      await _nearby.sendBytesPayload(_pineId!, encrypted);
    }
  }

  @override
  Future<void> sendMessagesRequest() async {
    final encrypted = Uint8List.fromList(utf8.encode(Constants.messages));
    await _nearby.sendBytesPayload(_pineId!, encrypted);
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
              onConnectionResult: (id, status) {},
              onDisconnected: (id) {
                _pineConnection = null;
                _pineId = null;
              },
            );
          }
        },
        onEndpointLost: (id) {
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
      await _nearby.acceptConnection(
        id,
        onPayLoadRecieved: (id, payload) async {
          if (_pineId != null) {
            final bytes = payload.bytes;
            if (payload.type == PayloadType.BYTES && bytes != null) {
              try {
                final data = utf8.decode(Uint8List.fromList(bytes));
                if (data.startsWith(Constants.messages)) {
                  final messages = data.substring(Constants.messages.length).split(Constants.delimiter);

                  /// add to event
                }
              } catch (ex) {
                // _dataSubject.add(DataEventModel.audioData(device: _devices[id]!, data: payload.bytes!));
              }
            } else if (payload.type == PayloadType.FILE) {}
          }
        },
        onPayloadTransferUpdate: (id, payloadTransferUpdate) {},
      );

      _pineConnection = info;
      _pineId = id;
    } catch (ex) {
      _pineConnection = null;
      _pineId = null;
    }
  }
}