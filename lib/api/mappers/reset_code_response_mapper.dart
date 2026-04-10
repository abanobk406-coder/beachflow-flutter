import 'package:por2/api/models/response/reset_code_response_dto.dart';
import 'package:por2/domain/entities/response/reset_code_response.dart';

extension ResetCodeResponseMapper on ResetCodeResponseDto{
  ResetCodeResponse toResetCodeResponse(){
    return ResetCodeResponse(message: message,status: status);
  }
}