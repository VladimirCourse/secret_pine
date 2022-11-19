import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:secret_pine/repository/human/human_repository.dart';

part 'info_bloc.freezed.dart';
part 'info_event.dart';
part 'info_state.dart';

class InfoBloc extends Bloc<InfoEvent, InfoState> {
  final HumanRepository humanRepository;

  InfoBloc({
    required this.humanRepository,
  }) : super(InfoState(isRangeCheckEnabled: humanRepository.isRangeCheckEnabled)) {
    on<_ToggleRangeCheck>(_handleToggleRangeCheck);
  }

  void _handleToggleRangeCheck(_ToggleRangeCheck event, Emitter<InfoState> emit) async {
    humanRepository.isRangeCheckEnabled = !humanRepository.isRangeCheckEnabled;

    emit(state.copyWith(isRangeCheckEnabled: humanRepository.isRangeCheckEnabled));
  }
}
