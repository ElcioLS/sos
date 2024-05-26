import 'package:flutter/material.dart';
import 'package:pulsator/pulsator.dart';
import 'package:sos/src/feature/home/widgets/confirm_dialog.dart';

class SosButton extends StatefulWidget {
  const SosButton({super.key});

  @override
  State<SosButton> createState() => _SosButtonState();
}

class _SosButtonState extends State<SosButton> with TickerProviderStateMixin {
  AnimationController? _controller;

  @override
  void initState() {
    _controller = AnimationController.unbounded(vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Pulsator(
      onCreated: (controller) {
        _controller = controller;
      },
      style: const PulseStyle(color: Colors.red),
      count: 10,
      autoStart: false,
      child: SizedBox(
        width: 150,
        height: 150,
        child: RawMaterialButton(
          fillColor: Colors.red,
          shape: const CircleBorder(),
          onPressed: () async {
            final response = await showDialog(
              context: context,
              builder: (_) => const ConfirmDialog(),
              barrierDismissible: false,
            );
            print(response);
          },
          child: const Text(
            'SOS',
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
            ),
          ),
        ),
      ),
    );
  }
}
