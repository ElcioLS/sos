import 'package:flutter/material.dart';

class TorchButton extends StatefulWidget {
  const TorchButton({super.key});

  @override
  State<TorchButton> createState() => _TorchButtonState();
}

class _TorchButtonState extends State<TorchButton> {
  bool active = false;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
      shape: const CircleBorder(),
      backgroundColor: (active) ? Colors.black : Colors.green,
      heroTag: 'torch_button',
      onPressed: () {
        setState(() {
          active = !active;
        });
      },
      child: Icon(
        active ? Icons.lightbulb : Icons.lightbulb_outline,
        color: (active) ? Colors.yellow : Colors.black,
      ),
    );
  }
}
