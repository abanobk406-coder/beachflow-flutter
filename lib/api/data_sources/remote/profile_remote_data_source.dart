import 'package:por2/api/models/response/user_dto.dart';

abstract class ProfileRemoteDataSource {
  Future<UserDto> getProfile(String token);
  Future<UserDto> updateProfile(String token, String name);
}
