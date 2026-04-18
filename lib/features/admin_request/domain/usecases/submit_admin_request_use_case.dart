import 'package:injectable/injectable.dart';
import 'package:por2/features/admin_request/domain/repositories/admin_request_repository.dart';

@lazySingleton
class SubmitAdminRequestUseCase {
  final AdminRequestRepository _repository;

  SubmitAdminRequestUseCase(this._repository);

  Future<void> call(String imageUrl) async {
    return await _repository.submitAdminRequest(imageUrl);
  }
}
