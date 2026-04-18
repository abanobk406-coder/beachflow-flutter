import 'package:injectable/injectable.dart';
import 'package:por2/api/data_sources/remote/profile_remote_data_source.dart';
import 'package:por2/api/mappers/user_mapper.dart';
import 'package:por2/domain/entities/response/user.dart';
import 'package:por2/domain/repositories/profile_repository.dart';

@Injectable(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource profileRemoteDataSource;

  ProfileRepositoryImpl({required this.profileRemoteDataSource});

  @override
  Future<User> getProfile(String token) async {
    final userDto = await profileRemoteDataSource.getProfile(token);
    return userDto.toUser();
  }

  @override
  Future<User> updateProfile(String token, String name) async {
    final userDto = await profileRemoteDataSource.updateProfile(token, name);
    return userDto.toUser();
  }
}
