import 'package:flutter/foundation.dart';
import 'package:secret_pine/model/data_event_model.dart';
import 'package:secret_pine/model/device_model.dart';
import 'package:secret_pine/model/device_event_model.dart';

abstract class HumanRepository {
  String get userName;

  Stream<DeviceEventModel> get devicesStream;

  Stream<DataEventModel> get dataStream;

  Future<void> start();

  Future<void> sendMessage(String message);

  Future<void> sendMessagesRequest();

  Future<void> sendImage(String filePath);

  Future<void> sendImageRequest();

  Future<void> stop();

  Future<void> close();
}
