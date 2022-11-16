import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:secret_pine/repository/human/human_repository.dart';

part 'human_bloc.freezed.dart';
part 'human_event.dart';
part 'human_state.dart';

class HumanBloc extends Bloc<HumanEvent, HumanState> {
  final HumanRepository humanRepository;

  StreamSubscription? _dataSubscription;

  HumanBloc({
    required this.humanRepository,
  }) : super(HumanState(name: humanRepository.userName)) {
    _dataSubscription = humanRepository.dataStream.listen((event) async {
      print(event);
      event.mapOrNull(

          // startAudio: (_) async {
          //   _isReceivingData = true;
          //   add(const HumanEvent.refreshDevices());
          //   await audioRepository.startPlay();
          // },
          // audioData: (data) async {
          //   await audioRepository.writeAudioSample(data.data);
          // },
          // stopAudio: (_) async {
          //   await audioRepository.stopPlay();
          //   add(const HumanEvent.refreshDevices());
          //   _isReceivingData = false;
          // },
          );
    });

    on<_StartTransmit>(_handleStartTransmit);
    on<_RefreshData>(_handleRefreshData);
    on<_SendMessage>(_handleSendMessage);
    on<_StopTransmit>(_handleStopTransmit);
  }

  void _handleStartTransmit(_StartTransmit event, Emitter<HumanState> emit) async {
    try {
      emit(state.copyWith(isTransmitting: true, isLoading: true));

      await humanRepository.start();

      emit(state.copyWith(isLoading: false));
    } catch (ex) {
      emit(state.copyWith(isTransmitting: false, isLoading: false));
    }
  }

  void _handleRefreshData(_RefreshData event, Emitter<HumanState> emit) async {}

  void _handleSendMessage(_SendMessage event, Emitter<HumanState> emit) async {
    try {
      await humanRepository.sendMessage(event.message);
    } catch (ex) {
      print(ex);
    }
  }

  void _handleStopTransmit(_StopTransmit event, Emitter<HumanState> emit) async {
    try {
      await humanRepository.stop();

      emit(state.copyWith(isTransmitting: false));
    } catch (ex) {
      emit(state.copyWith(isTransmitting: true));
    }
  }

  @override
  Future<void> close() async {
    await _dataSubscription?.cancel();

    super.close();
  }
}
