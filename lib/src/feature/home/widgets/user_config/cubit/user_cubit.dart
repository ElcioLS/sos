import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:sos/src/data/modules/user_model.dart';
import 'package:sos/src/repositories/user/user_repository.dart';
import 'package:sos/src/services/auth/auth_service.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserRepository _repository;
  AuthService _service;
  UserCubit({required UserRepository repository, required AuthService service})
      : _repository = repository,
        _service = service,
        super(UserInitial());

  Future<void> save(UserModel user) async {
    final userRepository = await _repository.update(user: user);
    if (userRepository != null) {
      _service.user = userRepository;
    }
  }
}
