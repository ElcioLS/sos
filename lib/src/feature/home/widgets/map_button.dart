import 'package:flutter/material.dart';
import 'package:sos/src/feature/home/widgets/map/map_module.dart';

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
        showModalBottomSheet(
            showDragHandle: true,
            context: context,
            builder: (context) => MapModule());
      },
      child: Icon(enable ? Icons.flood_outlined : Icons.flood_rounded),
    );
  }
}
