import 'package:secret_pine/model/data_event_model.dart';
import 'package:secret_pine/model/device_event_model.dart';

abstract class HumanRepository {
  String get userName;

  bool get isRangeCheckEnabled;

  set isRangeCheckEnabled(bool value);

  bool get isConnected;

  Stream<DeviceEventModel> get devicesStream;

  Stream<DataEventModel> get dataStream;

  Stream<int> get rangeStream;

  Future<void> start();

  Future<void> sendMessage(String message);

  Future<void> sendMessagesRequest();

  Future<void> sendImage(String filePath);

  Future<void> sendImageRequest();

  Future<void> stop();

  Future<void> close();
}
