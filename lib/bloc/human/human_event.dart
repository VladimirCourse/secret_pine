part of 'human_bloc.dart';

typedef ErrorCallback = void Function();

@freezed
class HumanEvent with _$HumanEvent {
  const factory HumanEvent.refreshData() = _RefreshData;

  const factory HumanEvent.startTransmit({required ErrorCallback onError}) = _StartTransmit;

  const factory HumanEvent.sendMessage({required String message}) = _SendMessage;

  const factory HumanEvent.stopTransmit() = _StopTransmit;
}
