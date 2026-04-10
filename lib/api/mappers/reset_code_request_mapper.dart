import 'package:por2/api/models/request/reset_code_request_dto.dart';
import 'package:por2/domain/entities/request/reset_code_request.dart';

extension ResetCodeRequestMapper on ResetCodeRequest{
  ResetCodeRequestDto toResetCodeRequestDto(){
    return ResetCodeRequestDto(email: email,otp: otp);
  }
}