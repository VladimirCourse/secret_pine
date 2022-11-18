import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mock_data/mock_data.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:secret_pine/repository/human/nearby_human_repository.dart';
import 'package:secret_pine/repository/human/human_repository.dart';
import 'package:provider/provider.dart';
import 'package:secret_pine/repository/pine/nearby_pine_repository.dart';
import 'package:secret_pine/repository/pine/pine_repository.dart';
import 'package:secret_pine/ui/pages/start/start_page.dart';
import 'package:path_provider/path_provider.dart';

late final String _userName;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);

  try {
    final id = await PlatformDeviceId.getDeviceId ?? mockUUID();
    _userName = 'Android ${id.substring(id.length - 4, id.length)}';
  } catch (ex) {
    _userName = 'Android';
  }

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<HumanRepository>(
          create: (_) => NearbyHumanRepository(userName: _userName),
          dispose: (_, repository) => repository.close(),
        ),
        Provider<PineRepository>(
          create: (_) => NearbyPineRepository(),
          dispose: (_, repository) => repository.close(),
        ),
      ],
      child: MaterialApp(
        title: 'Secret Pine',
        theme: ThemeData(
          inputDecorationTheme: const InputDecorationTheme(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 0.5, color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 0.5, color: Colors.white),
            ),
          ),
        ),
        home: const StartPage(),
      ),
    );
  }
}
