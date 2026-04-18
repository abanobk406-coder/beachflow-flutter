import 'package:por2/domain/entities/response/user.dart';

abstract class ProfileRepository {
  Future<User> getProfile(String token);
  Future<User> updateProfile(String token, String name);
}
