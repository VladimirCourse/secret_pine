import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nearby_connections/nearby_connections.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:secret_pine/bloc/info/info_bloc.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({
    super.key,
  });

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
    } catch (ex) {}
  }

  void _toggleRangeCheck(BuildContext context) {
    context.read<InfoBloc>().add(const InfoEvent.toggleRangeCheck());
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: SafeArea(
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.grey.shade900,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Если возникли неполадки, пожалуйста, проверьте, что Bluetooth, WIFI и GPS включены, а приложение получило все необходимые разрешения и попробуйте снова. Попробуйте выключить и включить эфир снова на всех устройствах.',
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    BlocBuilder<InfoBloc, InfoState>(
                      builder: (_, state) => Transform.scale(
                        scale: 0.75,
                        child: CupertinoSwitch(
                          trackColor: Colors.white,
                          activeColor: Colors.green,
                          value: state.isRangeCheckEnabled,
                          onChanged: (value) => _toggleRangeCheck(context),
                        ),
                      ),
                    ),
                    const Text(
                      'Включить проверку на расстояние',
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    )
                  ],
                ),
                const SizedBox(height: 16),
                Center(
                  child: TextButton(
                    onPressed: _askPermissions,
                    child: const Text(
                      'Запросить разрешения',
                      style: TextStyle(fontSize: 14, color: Colors.green),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
