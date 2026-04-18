import 'package:injectable/injectable.dart';
import 'package:por2/domain/repositories/favorites_repository.dart';

@injectable
class ToggleFavoriteUseCase {
  final FavoritesRepository repository;

  ToggleFavoriteUseCase({required this.repository});

  Future<void> invoke(String token, String beachId) {
    return repository.toggleFavorite(token, beachId);
  }
}
