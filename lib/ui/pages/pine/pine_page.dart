import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nearby_connections/nearby_connections.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:secret_pine/bloc/info/info_bloc.dart';
import 'package:secret_pine/bloc/pine/pine_bloc.dart';
import 'package:secret_pine/ui/pages/info/info_page.dart';
import 'package:secret_pine/ui/widgets/blink_switch.dart';

class PinePage extends StatefulWidget {
  const PinePage({super.key});

  @override
  State<PinePage> createState() => _PinePageState();
}

class _PinePageState extends State<PinePage> {
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
    context.read<PineBloc>().add(PineEvent.startTransmit(onError: _showError));
  }

  void _stopTransmit() {
    context.read<PineBloc>().add(const PineEvent.stopTransmit());
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              BlocBuilder<PineBloc, PineState>(
                builder: (_, state) => BlinkSwitch(
                  title: state.isLoading
                      ? 'Подключаемся...'
                      : state.isTransmitting
                          ? 'В эфире'
                          : 'Не в эфире',
                  isLoading: state.isLoading,
                  isTransmitting: state.isTransmitting,
                  onChanged: (value) => value ? _startTransmit() : _stopTransmit(),
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
