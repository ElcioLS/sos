import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:sos/src/repositories/location/location_repository.dart';
import 'package:sos/src/services/locator/locator_service.dart';

import '../../../../services/auth/auth_service.dart';

part 'sos_state.dart';

class SosCubit extends Cubit<SosState> {
  final LocationRepository _repository;
  final AuthService _authService;
  final LocatorService _locatorService;

  SosCubit({
    required LocationRepository repository,
    required AuthService authService,
    required LocatorService locatorService,
  })  : _repository = repository,
        _authService = authService,
        _locatorService = locatorService,
        super(SosInitial());

  Future<bool> acionarSos() async {
    await _repository.distressOn(
        latitude: _locatorService.position!.latitude,
        longitude: _locatorService.position!.longitude,
        sessionToken: _authService.user!.sessionToken);

    emit(DistressOnState());
    return true;
  }

  Future<bool> desligarSos() async {
    await _repository.distressOff(
        sessionToken: _authService.user!.sessionToken);

    emit(DistressOffState());
    return true;
  }
}
