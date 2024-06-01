import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:sos/src/services/auth_service.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final AuthService service;

  SplashCubit({required this.service}) : super(SplashInitial());

  Future<void> login() async {
    if (await service.login()) {
      emit(SplashLoggedState());
    } else {
      emit(SplashErrorState(erro: 'Falha'));
    }
  }
}
