import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:secret_pine/repository/pine/pine_repository.dart';

part 'pine_bloc.freezed.dart';
part 'pine_event.dart';
part 'pine_state.dart';

class PineBloc extends Bloc<PineEvent, PineState> {
  final PineRepository pineRepository;

  StreamSubscription? _dataSubscription;

  PineBloc({required this.pineRepository}) : super(PineState(name: pineRepository.userName)) {
    // _dataSubscription = transmitRepository.dataStream.listen((event) async {
    //   print(event);
    //   event.mapOrNull();
    // });

    on<_StartTransmit>(_handleStartTransmit);
    on<_RefreshData>(_handleRefreshData);
    on<_StopTransmit>(_handleStopTransmit);
  }

  void _handleStartTransmit(_StartTransmit event, Emitter<PineState> emit) async {
    try {
      emit(state.copyWith(isTransmitting: true, isLoading: true));

      await pineRepository.start();

      emit(state.copyWith(isLoading: false));
    } catch (ex) {
      emit(state.copyWith(isTransmitting: false, isLoading: false));
    }
  }

  void _handleRefreshData(_RefreshData event, Emitter<PineState> emit) async {}

  void _handleStopTransmit(_StopTransmit event, Emitter<PineState> emit) async {
    try {
      await pineRepository.stop();

      emit(state.copyWith(isTransmitting: false));
    } catch (ex) {
      emit(state.copyWith(isTransmitting: true));
    }
  }

  @override
  Future<void> close() async {
    await _dataSubscription?.cancel();

    await pineRepository.stop();

    super.close();
  }
}
