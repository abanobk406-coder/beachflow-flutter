import 'package:injectable/injectable.dart';
import 'package:por2/domain/entities/response/user.dart';
import 'package:por2/domain/repositories/profile_repository.dart';

@injectable
class UpdateProfileUseCase {
  final ProfileRepository profileRepository;

  UpdateProfileUseCase({required this.profileRepository});

  Future<User> invoke(String token, String name) {
    return profileRepository.updateProfile(token, name);
  }
}
