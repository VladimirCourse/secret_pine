import 'package:flutter/foundation.dart';
import 'package:secret_pine/model/data_event_model.dart';
import 'package:secret_pine/model/device_model.dart';
import 'package:secret_pine/model/device_event_model.dart';

enum TransmitMode { pine, human }

abstract class TransmitRepository {
  TransmitMode get mode;

  String get userName;

  List<DeviceModel> get devices;

  Stream<DeviceEventModel> get devicesStream;

  Stream<DataEventModel> get dataStream;

  Future<void> start(TransmitMode mode);

  Future<void> sendMessage(String message);

  Future<void> sendFile(String filePath);

  Future<void> stop();

  Future<void> close();
}
