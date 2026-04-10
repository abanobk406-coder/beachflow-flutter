import 'package:por2/domain/entities/request/resend_otp_request.dart';
import 'package:por2/domain/entities/response/resend_otp_response.dart';

abstract class ResentOtpRepository {

  Future<ResendOtpResponse> resendOtp(ResendOtpRequest resendOtpRequest);
}