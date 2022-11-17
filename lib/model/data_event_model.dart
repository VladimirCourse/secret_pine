import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_event_model.freezed.dart';

@freezed
class DataEventModel with _$DataEventModel {
  const factory DataEventModel.messages({required List<String> messages}) = _Messages;

  const factory DataEventModel.image({required String imagePath}) = _Image;
}
