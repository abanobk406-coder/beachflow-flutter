import 'package:injectable/injectable.dart';
import 'package:por2/domain/entities/response/beach.dart';
import 'package:por2/domain/repositories/favorites_repository.dart';

@injectable
class GetFavoritesUseCase {
  final FavoritesRepository repository;

  GetFavoritesUseCase({required this.repository});

  Future<List<Beach>> invoke(String token) {
    return repository.getFavorites(token);
  }
}
