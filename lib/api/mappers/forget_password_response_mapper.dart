import 'package:por2/api/models/response/forget_password_response_dto.dart';
import 'package:por2/domain/entities/response/forget_password_response.dart';

extension ForgetPasswordResponseMapper on ForgetPasswordResponseDto{
  ForgetPasswordResponse toForgetPasswordResponse(){
    return ForgetPasswordResponse(message: message);
  }
}