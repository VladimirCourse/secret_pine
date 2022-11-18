import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nearby_connections/nearby_connections.dart';
import 'package:secret_pine/bloc/pine/pine_bloc.dart';
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

  void _askPermissions() {
    final nearby = Nearby();

    nearby.askBluetoothPermission();
    nearby.askLocationAndExternalStoragePermission();
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
              BlocBuilder<PineBloc, PineState>(
                builder: (_, state) => BlinkSwitch(
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
