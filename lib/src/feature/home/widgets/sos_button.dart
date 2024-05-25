import 'package:flutter/material.dart';
import 'package:pulsator/pulsator.dart';

class SosButton extends StatelessWidget {
  const SosButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Pulsator(
      style: const PulseStyle(color: Colors.red),
      count: 10,
      child: SizedBox(
        width: 150,
        height: 150,
        child: RawMaterialButton(
          fillColor: Colors.red,
          shape: const CircleBorder(),
          onPressed: () {},
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
