import 'package:flutter/material.dart';
import 'package:secret_pine/repository/human/nearby_human_repository.dart';
import 'package:secret_pine/repository/human/human_repository.dart';
import 'package:provider/provider.dart';
import 'package:secret_pine/repository/pine/nearby_pine_repository.dart';
import 'package:secret_pine/repository/pine/pine_repository.dart';
import 'package:secret_pine/ui/pages/start/start_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<HumanRepository>(
          create: (_) => NearbyHumanRepository(),
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
          primarySwatch: Colors.blue,
        ),
        home: const StartPage(),
      ),
    );
  }
}
