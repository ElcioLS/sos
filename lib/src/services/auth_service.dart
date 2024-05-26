import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sos/src/repositories/user_repository.dart';

import '../data/modules/user_model.dart';

class AuthService {
  UserModel? user;
  final FlutterSecureStorage _storage;
  final UserRepository _repository;

  AuthService(
      {required FlutterSecureStorage storage,
      required UserRepository repository})
      : _storage = storage,
        _repository = repository;

  Future<bool> login() async {
    //logar
    final userRepository = await _repository.login();
    if (userRepository != null) {
      user = userRepository;
      await _storage.write(key: 'sessionToken', value: user?.sessionToken);
      return true;
    }
    return false;

    //gravar token
    //recuperar token
  }
}
