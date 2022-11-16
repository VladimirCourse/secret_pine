part of 'pine_bloc.dart';

@freezed
class PineState with _$PineState {
  const factory PineState({
    required String name,
    @Default(false) bool isLoading,
    @Default(false) bool isListening,
    // @Default([]) List<DeviceModel> devices,
  }) = _Data;
}
