import 'package:flutter/material.dart';
import 'package:sos/src/feature/home/widgets/alarm_button.dart';
import 'package:sos/src/feature/home/widgets/cubit/sos_cubit.dart';
import 'package:sos/src/feature/home/widgets/map_button.dart';
import 'package:sos/src/feature/home/widgets/torch_button.dart';
import 'package:sos/src/feature/home/widgets/user_config/user_config_module.dart';

import 'widgets/sos_button.dart';

class HomePage extends StatelessWidget {
  final SosCubit controller;
  const HomePage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton.filled(
            onPressed: () {
              showModalBottomSheet(
                showDragHandle: true,
                isScrollControlled: true,
                constraints: BoxConstraints.expand(
                  height: MediaQuery.sizeOf(context).height * .7,
                ),
                context: context,
                builder: (_) => UserConfigModule(),
              );
            },
            icon: const Icon(
              Icons.person,
              color: Colors.white,
            )),
      ),
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
