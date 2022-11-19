part of 'human_bloc.dart';

@freezed
class HumanState with _$HumanState {
  const factory HumanState({
    required String name,
    @Default(false) bool isLoading,
    @Default(false) bool isTransmitting,
    @Default(false) isConnected,
    @Default([]) List<String> messages,
    @Default(false) bool isClose,
    File? image,
  }) = _Data;
}
