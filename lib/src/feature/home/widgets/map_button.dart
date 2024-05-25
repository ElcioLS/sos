import 'package:flutter/material.dart';

class MapButton extends StatefulWidget {
  const MapButton({super.key});

  @override
  State<MapButton> createState() => _MapButtonState();
}

class _MapButtonState extends State<MapButton> {
  bool enable = false;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
      shape: const CircleBorder(),
      backgroundColor: Colors.green,
      heroTag: 'map_button',
      onPressed: () {
        setState(() {
          enable = !enable;
        });
      },
      child: Icon(enable ? Icons.flood_outlined : Icons.flood_rounded),
    );
  }
}
