import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nearby_connections/nearby_connections.dart';
import 'package:secret_pine/bloc/human/human_bloc.dart';
import 'package:secret_pine/ui/widgets/blink_switch.dart';

class HumanPage extends StatefulWidget {
  const HumanPage({super.key});

  @override
  State<HumanPage> createState() => _HumanPageState();
}

class _HumanPageState extends State<HumanPage> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    try {
      _askPermissions();
    } catch (ex) {
      _showError();
    }
  }

  void _askPermissions() {
    final nearby = Nearby();

    nearby.askBluetoothPermission();
    nearby.askLocationPermission();
  }

  void _startTransmit() {
    context.read<HumanBloc>().add(HumanEvent.startTransmit(onError: _showError));
  }

  void _refresh() {
    context.read<HumanBloc>().add(const HumanEvent.sendDataRequest());
  }

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      context.read<HumanBloc>().add(HumanEvent.sendMessage(message: text));
    }
  }

  void _stopTransmit() {
    context.read<HumanBloc>().add(const HumanEvent.stopTransmit());
  }

  Future<void> _sendImage() async {
    try {
      final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 50,
        maxWidth: 256,
        maxHeight: 256,
      );

      if (image != null) {
        context.read<HumanBloc>().add(HumanEvent.sendImage(imagePath: image.path));
      }
    } catch (ex) {
      print(ex);
      _showError(error: 'Ошибка отправки картинки');
    }
  }

  void _showError({String? error}) {
    final snackBar = SnackBar(
      duration: const Duration(seconds: 5),
      content: Text(
        error ??
            'Ошибочка:( Пожалуйста, проверьте, что BT, WIFI и GPS включены, а приложение получило все необходимые разрешения и попробуйте снова',
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _showInfo() {
    // showModalBottomSheet(
    //   context: context,
    //   builder: (_) => const InfoPage(),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          actions: [
            IconButton(
              onPressed: _showInfo,
              icon: const Icon(Icons.question_mark),
            ),
          ],
        ),
        backgroundColor: Colors.black,
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              BlocBuilder<HumanBloc, HumanState>(
                builder: (_, state) => Expanded(
                  child: Column(
                    children: [
                      if (state.messages.isNotEmpty)
                        const Text(
                          'Список сообщений',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      Expanded(
                        child: ListView(
                          children: state.messages
                              .map(
                                (message) => Text(
                                  message,
                                  style: const TextStyle(color: Colors.white, fontSize: 16),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              BlocBuilder<HumanBloc, HumanState>(
                builder: (_, state) => state.image != null
                    ? Image.file(
                        state.image!,
                        key: ValueKey(state.image!.hashCode),
                      )
                    : const SizedBox(),
              ),
              BlocBuilder<HumanBloc, HumanState>(
                builder: (_, state) => BlinkSwitch(
                  isLoading: state.isLoading,
                  isTransmitting: state.isTransmitting,
                  onChanged: (value) => value ? _startTransmit() : _stopTransmit(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _controller,
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),
              TextButton(onPressed: _sendMessage, child: const Text('Отправить')),
              const SizedBox(height: 20),
              TextButton(onPressed: _refresh, child: const Text('Обновить')),
              const SizedBox(height: 20),
              TextButton(onPressed: _sendImage, child: const Text('Отправить картинку')),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
