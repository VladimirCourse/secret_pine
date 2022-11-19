import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nearby_connections/nearby_connections.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:secret_pine/bloc/human/human_bloc.dart';
import 'package:secret_pine/bloc/info/info_bloc.dart';
import 'package:secret_pine/ui/pages/info/info_page.dart';
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

  Future<void> _askPermissions() async {
    try {
      await [
        Permission.bluetooth,
        Permission.bluetoothAdvertise,
        Permission.bluetoothConnect,
        Permission.bluetoothScan,
        Permission.manageExternalStorage,
        Permission.storage,
        Permission.location,
        Permission.nearbyWifiDevices,
      ].request();
    } catch (ex) {
      _showError();
    }
  }

  void _startTransmit() {
    context.read<HumanBloc>().add(HumanEvent.startTransmit(onError: _showError));
  }

  void _sendMessage() {
    final text = _controller.text.trim();

    if (text.isNotEmpty) {
      context
          .read<HumanBloc>()
          .add(HumanEvent.sendMessage(message: text, onError: () => _showError(error: 'Ошибка отправки сообщения')));

      _controller.clear();
    }
  }

  void _stopTransmit() {
    context.read<HumanBloc>().add(const HumanEvent.stopTransmit());
  }

  Future<void> _sendImage() async {
    final bloc = context.read<HumanBloc>();
    try {
      final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 70,
        maxWidth: 512,
        maxHeight: 512,
      );

      if (image != null) {
        bloc.add(
          HumanEvent.sendImage(imagePath: image.path, onError: () => _showError(error: 'Ошибка отправки картинки')),
        );
      }
    } catch (ex) {
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
    showModalBottomSheet(
      context: context,
      builder: (_) => BlocProvider(
        create: (_) => InfoBloc(
          humanRepository: context.read(),
        ),
        child: const InfoPage(),
      ),
    );
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                BlocBuilder<HumanBloc, HumanState>(
                  builder: (_, state) => BlinkSwitch(
                    title: state.isLoading
                        ? 'Выходим в эфир...'
                        : state.isTransmitting
                            ? state.isConnected
                                ? state.isClose
                                    ? 'Подключились к сосне'
                                    : 'Слишком далеко, подойдите ближе'
                                : 'Подключаемся к сосне...'
                            : 'Не в эфире',
                    isLoading: state.isLoading || !(state.isClose && state.isConnected),
                    isTransmitting: state.isTransmitting,
                    onChanged: (value) => value ? _startTransmit() : _stopTransmit(),
                  ),
                ),
                const SizedBox(height: 30),
                BlocBuilder<HumanBloc, HumanState>(
                  builder: (_, state) => state.image != null && state.isClose
                      ? Image.file(
                          state.image!,
                          key: ValueKey(state.image!.hashCode),
                          errorBuilder: (_, __, ___) => const SizedBox(),
                          height: MediaQuery.of(context).size.height * 0.15,
                        )
                      : const SizedBox(),
                ),
                BlocBuilder<HumanBloc, HumanState>(
                  builder: (_, state) => state.isClose && state.isConnected
                      ? TextButton(
                          onPressed: _sendImage,
                          child: const Text(
                            'Отправить картинку',
                            style: TextStyle(color: Colors.green),
                          ),
                        )
                      : const SizedBox(),
                ),
                const SizedBox(height: 20),
                BlocBuilder<HumanBloc, HumanState>(
                  builder: (_, state) => state.isClose
                      ? Column(
                          children: [
                            if (state.messages.isNotEmpty)
                              const Text(
                                'Список последних сообщений',
                                style: TextStyle(color: Colors.white, fontSize: 16),
                              ),
                            const SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                        )
                      : const SizedBox(),
                ),
                const SizedBox(height: 20),
                BlocBuilder<HumanBloc, HumanState>(
                  builder: (_, state) => state.isClose && state.isConnected
                      ? Row(
                          children: [
                            const SizedBox(width: 32),
                            Flexible(
                              child: TextField(
                                controller: _controller,
                                style: const TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  hintText: 'Введите сообщение',
                                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            TextButton(
                              onPressed: _sendMessage,
                              child: const Text(
                                'Отправить',
                                style: TextStyle(color: Colors.green),
                              ),
                            ),
                            const SizedBox(width: 12),
                          ],
                        )
                      : const SizedBox(),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
