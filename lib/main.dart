import 'package:flutter/material.dart';
import 'package:secret_pine/repository/transmit/nearby_transmit_repository.dart';
import 'package:secret_pine/repository/transmit/transmit_repository.dart';
import 'package:provider/provider.dart';
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
        Provider<TransmitRepository>(
          lazy: false,
          create: (_) => NearbyTransmitRepository(),
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
