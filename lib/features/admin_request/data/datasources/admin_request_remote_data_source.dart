import 'package:injectable/injectable.dart';
import 'package:por2/api/api_services.dart';

abstract class AdminRequestRemoteDataSource {
  Future<void> submitAdminRequest(String token, String imageUrl);
}

@LazySingleton(as: AdminRequestRemoteDataSource)
class AdminRequestRemoteDataSourceImpl implements AdminRequestRemoteDataSource {
  final ApiServices _apiServices;

  AdminRequestRemoteDataSourceImpl(this._apiServices);

  @override
  Future<void> submitAdminRequest(String token, String imageUrl) async {
    await _apiServices.requestAdmin(token, {
      "idCardUrl": imageUrl,
    });
  }
}
