import 'package:sos/src/data/modules/user_model.dart';

import './user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  Future<UserModel?> login() {
    throw UnimplementedError();
  }

  @override
  Future<UserModel?> me({required String sessionToken}) {
    throw UnimplementedError();
  }

  @override
  Future<UserModel?> update({required UserModel user}) {
    throw UnimplementedError();
  }
}
