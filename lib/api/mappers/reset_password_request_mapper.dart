import 'package:por2/api/models/request/reset_password_request_dto.dart';
import 'package:por2/domain/entities/request/reset_password_request.dart';

extension ResetPasswordRequestMapper on ResetPasswordRequest{
  ResetPasswordRequestDto toResetPasswordRequestDto(){
    return ResetPasswordRequestDto(
      email: email,
      newPassword: newPassword
    );
  }
}