import 'package:flutter/material.dart';
import 'package:sos/src/feature/home/widgets/alarm_button.dart';
import 'package:sos/src/feature/home/widgets/cubit/sos_cubit.dart';
import 'package:sos/src/feature/home/widgets/map_button.dart';
import 'package:sos/src/feature/home/widgets/torch_button.dart';

import 'widgets/sos_button.dart';

class HomePage extends StatelessWidget {
  final SosCubit controller;
  const HomePage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SosButton(
              controller: controller,
            ),
          ),
          const Padding(
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
