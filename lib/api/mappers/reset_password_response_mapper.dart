import 'package:por2/api/models/response/reset_password_response_dto.dart';
import 'package:por2/domain/entities/response/reset_password_response.dart';

extension ResetPasswordResponseMapper on ResetPasswordResponseDto{
  ResetPasswordResponse toResetPasswordResponse(){
    return ResetPasswordResponse(status: status,message: message);
  }
}