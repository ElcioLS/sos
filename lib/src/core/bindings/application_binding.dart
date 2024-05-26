import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApplicationBinding extends ApplicationBindings {
  @override
  List<Bind<Object>> bindings() => [
        Bind.lazySingleton<Dio>((i) => Dio()),
        Bind.lazySingleton<AudioPlayer>(
            (i) => AudioPlayer()..setReleaseMode(ReleaseMode.loop)),
        Bind.lazySingleton<FlutterSecureStorage>(
            (i) => const FlutterSecureStorage()),
      ];
}
