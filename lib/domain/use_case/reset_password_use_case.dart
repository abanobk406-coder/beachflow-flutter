import 'package:injectable/injectable.dart';
import 'package:por2/domain/entities/request/reset_password_request.dart';
import 'package:por2/domain/entities/response/reset_password_response.dart';
import 'package:por2/domain/repositories/reset_password_repository.dart';

@injectable
class ResetPasswordUseCase {

  ResetPasswordRepository resetPasswordRepository;

  ResetPasswordUseCase({required this.resetPasswordRepository});

  Future<ResetPasswordResponse> invoke({required ResetPasswordRequest resetPasswordRequest}){
    return resetPasswordRepository.resetPassword(resetPasswordRequest);
  }
}