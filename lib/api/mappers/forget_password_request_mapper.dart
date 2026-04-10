import 'package:por2/api/models/request/forget_password_request_dto.dart';
import 'package:por2/domain/entities/request/forget_password_request.dart';

extension ForgetPasswordRequestMapper on ForgetPasswordRequest{
  ForgetPasswordRequestDto toForgetPasswordRequestDto(){
    return ForgetPasswordRequestDto(
      email: email
    );
  }
}