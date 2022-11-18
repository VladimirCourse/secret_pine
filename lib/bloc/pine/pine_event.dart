part of 'pine_bloc.dart';

typedef ErrorCallback = void Function();

@freezed
class PineEvent with _$PineEvent {
  const factory PineEvent.startTransmit({required ErrorCallback onError}) = _StartTransmit;

  const factory PineEvent.stopTransmit() = _StopTransmit;
}
