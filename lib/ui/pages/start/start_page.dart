import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secret_pine/bloc/human/human_bloc.dart';
import 'package:secret_pine/bloc/pine/pine_bloc.dart';
import 'package:secret_pine/ui/pages/human/human_page.dart';
import 'package:secret_pine/ui/pages/pine/pine_page.dart';
import 'package:secret_pine/ui/pages/start/widgets/start_button.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  Future<void> _openPinePage(BuildContext context) async {
    await Navigator.of(context).push(
      CupertinoPageRoute(
        fullscreenDialog: true,
        builder: (_) => BlocProvider(
          create: (_) => PineBloc(
            pineRepository: context.read(),
          ),
          child: const PinePage(),
        ),
      ),
    );
  }

  Future<void> _openHumanPage(BuildContext context) async {
    await Navigator.of(context).push(
      CupertinoPageRoute(
        fullscreenDialog: true,
        builder: (_) => BlocProvider(
          create: (_) => HumanBloc(
            humanRepository: context.read(),
          ),
          child: const HumanPage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              StartButton(
                text: 'Режим\nсосны',
                color: Colors.green,
                icon: const Icon(
                  Icons.forest,
                  size: 50,
                  color: Colors.white,
                ),
                onPressed: () => _openPinePage(context),
              ),
              const SizedBox(height: 20),
              StartButton(
                text: 'Режим\nчеловека',
                color: Colors.blue,
                icon: const Icon(
                  Icons.man,
                  size: 50,
                  color: Colors.white,
                ),
                onPressed: () => _openHumanPage(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
