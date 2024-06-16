import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:sos/src/feature/home/widgets/alarm_button.dart';
import 'package:sos/src/feature/home/widgets/cubit/sos_cubit.dart';
import 'package:sos/src/feature/home/widgets/map_button.dart';
import 'package:sos/src/feature/home/widgets/torch_button.dart';
import 'package:sos/src/feature/home/widgets/user_config/user_config_module.dart';
import 'package:torch_controller/torch_controller.dart';

import 'widgets/sos_button.dart';

class HomePage extends StatefulWidget {
  final SosCubit controller;
  const HomePage({super.key, required this.controller});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Timer? timer;
  bool? backgroundColor;
  TorchController controller = TorchController();

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SosCubit, SosState>(
      bloc: context.get(),
      listener: (context, state) {
        if (state is DistressOffState) {
          context.get<AudioPlayer>().stop();
          setState(() {
            backgroundColor = null;
          });
          timer?.cancel();
        } else if (state is DistressOnState) {
          context.get<AudioPlayer>().resume();

          timer = Timer.periodic(Duration(milliseconds: 10), (_) {
            controller.toggle();
            setState(() {
              backgroundColor = switch (backgroundColor) {
                true => false,
                false => true,
                _ => true,
              };
            });
          });
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 50),
        color: switch (backgroundColor) {
          true => Colors.blue.shade900,
          false => Colors.red.shade900,
          _ => Colors.white,
        },
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
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
                  controller: widget.controller,
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
        ),
      ),
    );
  }
}
