import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:secret_pine/repository/transmit/transmit_repository.dart';

part 'pine_bloc.freezed.dart';
part 'pine_event.dart';
part 'pine_state.dart';

class PineBloc extends Bloc<PineEvent, PineState> {
  final TransmitRepository transmitRepository;

  StreamSubscription? _dataSubscription;

  PineBloc({
    required this.transmitRepository,
  }) : super(PineState(name: transmitRepository.userName)) {
    _dataSubscription = transmitRepository.dataStream.listen((event) async {
      print(event);
      event.mapOrNull(

          // startAudio: (_) async {
          //   _isReceivingData = true;
          //   add(const PineEvent.refreshDevices());
          //   await audioRepository.startPlay();
          // },
          // audioData: (data) async {
          //   await audioRepository.writeAudioSample(data.data);
          // },
          // stopAudio: (_) async {
          //   await audioRepository.stopPlay();
          //   add(const PineEvent.refreshDevices());
          //   _isReceivingData = false;
          // },
          );
    });

    on<_StartTransmit>(_handleStartTransmit);
    on<_RefreshData>(_handleRefreshData);
    on<_StopTransmit>(_handleStopTransmit);
  }

  void _handleStartTransmit(_StartTransmit event, Emitter<PineState> emit) async {
    try {
      emit(state.copyWith(isListening: true, isLoading: true));

      await transmitRepository.start(TransmitMode.pine);

      emit(state.copyWith(isLoading: false));
    } catch (ex) {
      emit(state.copyWith(isListening: false, isLoading: false));
    }
  }

  void _handleRefreshData(_RefreshData event, Emitter<PineState> emit) async {}

  void _handleStopTransmit(_StopTransmit event, Emitter<PineState> emit) async {
    try {
      await transmitRepository.stop();

      emit(state.copyWith(isListening: false));
    } catch (ex) {
      emit(state.copyWith(isListening: true));
    }
  }

  @override
  Future<void> close() async {
    await _dataSubscription?.cancel();

    super.close();
  }
}
