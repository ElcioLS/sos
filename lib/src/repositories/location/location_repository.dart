import 'package:sos/src/data/modules/user_model.dart';

abstract interface class LocationRepository {
  Future<bool> distressOn({
    required String sessionToken,
    required double latitude,
    required double longitude,
  });

  Future<bool> distressOff({required String sessionToken});
  Future<List<UserModel>?> nearby({required String sessionToken});
}
