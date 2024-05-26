abstract interface class UserRepository {
  Future<void> login();
  Future<void> me({String sessionToken});
Future<void> update({required Object user});
}
