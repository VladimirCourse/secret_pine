import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:secret_pine/ui/widgets/blink_indicator.dart';

class BlinkSwitch extends StatelessWidget {
  final bool isTransmitting;
  final bool isLoading;
  final String title;
  final ValueChanged<bool> onChanged;

  const BlinkSwitch({
    super.key,
    required this.isTransmitting,
    required this.isLoading,
    required this.title,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        BlinkIndicator(
          isOn: isTransmitting && !isLoading,
          color: Colors.green,
          child: Transform.scale(
            scale: 1.5,
            child: CupertinoSwitch(
              value: isTransmitting,
              trackColor: Colors.red,
              activeColor: isLoading ? Colors.yellow : Colors.green,
              onChanged: onChanged,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
