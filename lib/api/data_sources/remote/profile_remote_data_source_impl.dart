import 'package:injectable/injectable.dart';
import 'package:por2/api/api_services.dart';
import 'package:por2/api/data_sources/remote/profile_remote_data_source.dart';
import 'package:por2/api/models/response/user_dto.dart';
import 'package:por2/api/models/request/update_profile_request_dto.dart';

@Injectable(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final ApiServices apiServices;

  ProfileRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<UserDto> getProfile(String token) {
    return apiServices.getProfile(token);
  }

  @override
  Future<UserDto> updateProfile(String token, String name) {
    return apiServices.updateProfile(
      token,
      UpdateProfileRequestDto(name: name),
    );
  }
}
