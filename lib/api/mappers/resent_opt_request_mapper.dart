import 'package:por2/api/models/request/resend_otp_request_dto.dart';
import 'package:por2/domain/entities/request/resend_otp_request.dart';

extension ResentOptRequestMapper on ResendOtpRequest{
  ResendOtpRequestDto toResendOtpRequestDto(){
    return ResendOtpRequestDto(email: email);
  }
}