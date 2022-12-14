import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:secret_pine/repository/human/human_repository.dart';

part 'human_bloc.freezed.dart';
part 'human_event.dart';
part 'human_state.dart';

class HumanBloc extends Bloc<HumanEvent, HumanState> {
  final HumanRepository humanRepository;

  StreamSubscription? _deviceSubscription;
  StreamSubscription? _dataSubscription;
  StreamSubscription? _rangeSubscription;

  HumanBloc({required this.humanRepository}) : super(HumanState(name: humanRepository.userName)) {
    _deviceSubscription = humanRepository.devicesStream.listen((event) async {
      event.mapOrNull(
        connected: (event) => add(const HumanEvent.sendDataRequest()),
      );
    });

    _dataSubscription = humanRepository.dataStream.listen((event) async {
      event.mapOrNull(
        messages: (event) => add(HumanEvent.refreshMessages(messages: event.messages)),
        image: (event) => add(HumanEvent.refreshImage(imagePath: event.imagePath)),
      );
    });

    _rangeSubscription = humanRepository.rangeStream.listen((event) async {
      add(HumanEvent.refreshRange(range: event));
    });

    on<_StartTransmit>(_handleStartTransmit);
    on<_RefreshMessages>(_handleRefreshMessages);
    on<_RefreshImage>(_handleRefreshImage);
    on<_RefreshRange>(_handleRefreshRange);
    on<_SendDataRequest>(_handleSendDataRequest);
    on<_SendMessage>(_handleSendMessage);
    on<_SendImage>(_handleSendImage);
    on<_StopTransmit>(_handleStopTransmit);
  }

  void _handleStartTransmit(_StartTransmit event, Emitter<HumanState> emit) async {
    try {
      emit(state.copyWith(isTransmitting: true, isLoading: true));

      await humanRepository.start();

      emit(state.copyWith(isLoading: false));
    } catch (ex) {
      event.onError();

      emit(state.copyWith(isTransmitting: false, isLoading: false));
    }
  }

  void _handleRefreshMessages(_RefreshMessages event, Emitter<HumanState> emit) async {
    emit(state.copyWith(messages: event.messages, isConnected: true));
  }

  void _handleRefreshImage(_RefreshImage event, Emitter<HumanState> emit) async {
    try {
      await FileImage(File(event.imagePath)).evict();

      emit(state.copyWith(image: File(event.imagePath), isConnected: true));
    } catch (ex) {}
  }

  void _handleRefreshRange(_RefreshRange event, Emitter<HumanState> emit) async {
    emit(state.copyWith(isClose: event.range <= 60 || !humanRepository.isRangeCheckEnabled));
  }

  void _handleSendDataRequest(_SendDataRequest event, Emitter<HumanState> emit) async {
    try {
      await humanRepository.sendMessagesRequest();
      await humanRepository.sendImageRequest();

      emit(state.copyWith(isConnected: true));
    } catch (ex) {
      event.onError?.call();
    }
  }

  void _handleSendMessage(_SendMessage event, Emitter<HumanState> emit) async {
    try {
      await humanRepository.sendMessage(event.message);
    } catch (ex) {
      event.onError();
    }
  }

  void _handleSendImage(_SendImage event, Emitter<HumanState> emit) async {
    try {
      await humanRepository.sendImage(event.imagePath);
    } catch (ex) {
      event.onError();
    }
  }

  void _handleStopTransmit(_StopTransmit event, Emitter<HumanState> emit) async {
    try {
      await humanRepository.stop();

      emit(state.copyWith(isTransmitting: false, isConnected: false, isClose: false));
    } catch (ex) {
      emit(state.copyWith(isTransmitting: true));
    }
  }

  @override
  Future<void> close() async {
    await _dataSubscription?.cancel();
    await _deviceSubscription?.cancel();
    await _rangeSubscription?.cancel();

    await humanRepository.stop();

    super.close();
  }
}
