import 'package:flutter/material.dart';

class AlarmButton extends StatefulWidget {
  const AlarmButton({super.key});

  @override
  State<AlarmButton> createState() => _AlarmButtonState();
}

class _AlarmButtonState extends State<AlarmButton> {
  bool enable = false;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
      shape: const CircleBorder(),
      backgroundColor: Colors.green,
      heroTag: 'alarm_button',
      onPressed: () {
        setState(() {
          enable = !enable;
        });
      },
      child: Icon(enable ? Icons.volume_off : Icons.volume_up),
    );
  }
}
