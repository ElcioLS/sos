import 'package:flutter/material.dart';
import 'package:sos/src/feature/home/widgets/alarm_button.dart';
import 'package:sos/src/feature/home/widgets/map_button.dart';
import 'package:sos/src/feature/home/widgets/torch_button.dart';

import 'widgets/sos_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SosButton(),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AlarmButton(),
                TorchButton(),
                MapButton(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
