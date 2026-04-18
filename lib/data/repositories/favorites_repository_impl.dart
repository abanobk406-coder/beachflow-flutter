import 'package:injectable/injectable.dart';
import 'package:por2/api/data_sources/remote/favorites_remote_data_source.dart';
import 'package:por2/domain/entities/response/beach.dart';
import 'package:por2/domain/repositories/favorites_repository.dart';

@Injectable(as: FavoritesRepository)
class FavoritesRepositoryImpl implements FavoritesRepository {
  final FavoritesRemoteDataSource favoritesRemoteDataSource;

  FavoritesRepositoryImpl({required this.favoritesRemoteDataSource});

  @override
  Future<List<Beach>> getFavorites(String token) async {
    final beachDtos = await favoritesRemoteDataSource.getFavorites(token);
    return beachDtos.map((dto) => dto.toBeach()).toList();
  }

  @override
  Future<void> toggleFavorite(String token, String beachId) {
    return favoritesRemoteDataSource.toggleFavorite(token, beachId);
  }
}
