import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:sos/src/feature/home/widgets/user_config/cubit/user_cubit.dart';
import 'package:sos/src/feature/home/widgets/user_config/user_config.dart';
import 'package:sos/src/services/auth_service.dart';

class UserConfigModule extends FlutterGetItModulePageRouter {
  const UserConfigModule({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton((i) => UserCubit()),
      ];

  @override
  WidgetBuilder get view => (context) => UserConfig(
        user: context.get<AuthService>().user!,
      );
}
