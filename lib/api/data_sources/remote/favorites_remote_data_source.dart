import 'package:por2/api/models/response/beach_dto.dart';

abstract class FavoritesRemoteDataSource {
  Future<List<BeachDto>> getFavorites(String token);
  Future<void> toggleFavorite(String token, String beachId);
}
