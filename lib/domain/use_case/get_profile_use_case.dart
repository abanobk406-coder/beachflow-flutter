import 'package:injectable/injectable.dart';
import 'package:por2/domain/entities/response/user.dart';
import 'package:por2/domain/repositories/profile_repository.dart';

@injectable
class GetProfileUseCase {
  final ProfileRepository profileRepository;

  GetProfileUseCase({required this.profileRepository});

  Future<User> invoke(String token) {
    return profileRepository.getProfile(token);
  }
}
