import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:sos/src/feature/home/widgets/map/cubit/map_cubit.dart';
import 'package:sos/src/feature/home/widgets/map/map_page.dart';

class MapModule extends FlutterGetItModulePageRouter {
  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton(
            (i) => MapCubit(repository: i(), service: i())..nearby())
      ];

  @override
  WidgetBuilder get view => (context) => const MapPage();
}
