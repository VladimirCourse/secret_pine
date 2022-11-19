part of 'human_bloc.dart';

typedef ErrorCallback = void Function();

@freezed
class HumanEvent with _$HumanEvent {
  const factory HumanEvent.startTransmit({required ErrorCallback onError}) = _StartTransmit;

  const factory HumanEvent.refreshMessages({required List<String> messages}) = _RefreshMessages;

  const factory HumanEvent.refreshImage({required String imagePath}) = _RefreshImage;

  const factory HumanEvent.refreshRange({required int range}) = _RefreshRange;

  const factory HumanEvent.sendMessage({required String message, required ErrorCallback onError}) = _SendMessage;

  const factory HumanEvent.sendImage({required String imagePath, required ErrorCallback onError}) = _SendImage;

  const factory HumanEvent.sendDataRequest({ErrorCallback? onError}) = _SendDataRequest;

  const factory HumanEvent.stopTransmit() = _StopTransmit;
}
