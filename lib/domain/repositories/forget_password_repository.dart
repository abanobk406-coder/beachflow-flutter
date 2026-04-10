import 'package:por2/domain/entities/request/forget_password_request.dart';
import 'package:por2/domain/entities/response/forget_password_response.dart';

abstract class ForgetPasswordRepository {

  Future<ForgetPasswordResponse> forgetPassword(ForgetPasswordRequest forgetPasswordRequest);

}