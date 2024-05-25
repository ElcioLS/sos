import 'package:flutter/material.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Deseja realmente ativar o SOS?'),
          TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0, end: 5),
            duration: const Duration(seconds: 5),
            builder: (context, value, child) {
              return CircularProgressIndicator(
                value: value / 5,
              );
            },
          )
        ],
      ),
      actions: [
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancelar'))
      ],
    );
  }
}
