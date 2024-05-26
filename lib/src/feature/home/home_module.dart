import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

import 'home_page.dart';
import 'widgets/cubit/sos_cubit.dart';

class HomeModule extends FlutterGetItModule {
  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton((i) => SosCubit()),
      ];

  @override
  String get moduleRouteName => '/home';

  @override
  Map<String, WidgetBuilder> get pages => {
        '/': (context) => HomePage(controller: Injector.get(),),
      };
}
