import 'package:injectable/injectable.dart';
import 'package:por2/api/api_services.dart';
import 'package:por2/api/data_sources/remote/favorites_remote_data_source.dart';
import 'package:por2/api/models/response/beach_dto.dart';

@Injectable(as: FavoritesRemoteDataSource)
class FavoritesRemoteDataSourceImpl implements FavoritesRemoteDataSource {
  final ApiServices apiServices;

  FavoritesRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<List<BeachDto>> getFavorites(String token) {
    return apiServices.getFavorites(token);
  }

  @override
  Future<void> toggleFavorite(String token, String beachId) {
    return apiServices.toggleFavorite(token, {"beachId": beachId});
  }
}
