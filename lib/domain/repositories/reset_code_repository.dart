import 'package:por2/domain/entities/request/reset_code_request.dart';
import 'package:por2/domain/entities/response/reset_code_response.dart';

abstract class ResetCodeRepository {

  Future<ResetCodeResponse> verifyResetCode(ResetCodeRequest resetCodeRequest);
}