import 'package:por2/api/models/response/resend_otp_response_dto.dart';
import 'package:por2/domain/entities/response/resend_otp_response.dart';

extension ResendOptResponseMapper on ResendOtpResponseDto{
  ResendOtpResponse toResendOtpResponse(){
    return ResendOtpResponse(status: status,message: message);
  }
}