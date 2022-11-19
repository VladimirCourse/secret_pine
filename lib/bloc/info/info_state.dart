part of 'info_bloc.dart';

@freezed
class InfoState with _$InfoState {
  const factory InfoState({
    required bool isRangeCheckEnabled,
  }) = _InfoState;
}
