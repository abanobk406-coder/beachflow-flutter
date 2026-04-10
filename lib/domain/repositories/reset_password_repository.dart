import 'package:por2/domain/entities/request/reset_password_request.dart';
import 'package:por2/domain/entities/response/reset_password_response.dart';

abstract class ResetPasswordRepository {

  Future<ResetPasswordResponse> resetPassword(ResetPasswordRequest resetPasswordRequest);
}