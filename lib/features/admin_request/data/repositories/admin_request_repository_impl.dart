import 'package:injectable/injectable.dart';
import 'package:por2/features/admin_request/data/datasources/admin_request_remote_data_source.dart';
import 'package:por2/features/admin_request/domain/repositories/admin_request_repository.dart';
import 'package:por2/shared_preferences/shared_preferences.dart';

@LazySingleton(as: AdminRequestRepository)
class AdminRequestRepositoryImpl implements AdminRequestRepository {
  final AdminRequestRemoteDataSource _remoteDataSource;

  AdminRequestRepositoryImpl(this._remoteDataSource);

  @override
  Future<void> submitAdminRequest(String imageUrl) async {
    final String? token = await SharedPreferencesUtils.getToken(key: 'token');
    if (token == null) {
      throw Exception("No token found");
    }

    await _remoteDataSource.submitAdminRequest("Bearer $token", imageUrl);
  }
}
