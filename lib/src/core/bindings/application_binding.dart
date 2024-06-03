import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sos/src/core/interceptor/b4a_intercept.dart';
import 'package:sos/src/repositories/user/user_repository.dart';
import 'package:sos/src/repositories/user/user_repository_impl.dart';
import 'package:sos/src/services/auth/auth_service.dart';
import 'package:sos/src/services/locator/locator_service.dart';

class ApplicationBinding extends ApplicationBindings {
  @override
  List<Bind<Object>> bindings() => [
        Bind.lazySingleton<Dio>((i) => Dio()..interceptors.add(B4aIntercept())),
        Bind.lazySingleton<AudioPlayer>(
            (i) => AudioPlayer()..setReleaseMode(ReleaseMode.loop)),
        Bind.lazySingleton<FlutterSecureStorage>(
            (i) => const FlutterSecureStorage()),
        Bind.lazySingleton<UserRepository>((i) => UserRepositoryImpl(dio: i())),
        Bind.singleton<LocatorService>((i) => LocatorService()..init()),
        Bind.lazySingleton<AuthService>(
            (i) => AuthService(storage: i(), repository: i()))
      ];
}
