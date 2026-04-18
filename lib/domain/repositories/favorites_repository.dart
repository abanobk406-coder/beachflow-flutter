import 'package:por2/domain/entities/response/beach.dart';

abstract class FavoritesRepository {
  Future<List<Beach>> getFavorites(String token);
  Future<void> toggleFavorite(String token, String beachId);
}
