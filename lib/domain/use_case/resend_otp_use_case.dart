import 'package:injectable/injectable.dart';
import 'package:por2/domain/entities/request/resend_otp_request.dart';
import 'package:por2/domain/entities/response/resend_otp_response.dart';
import 'package:por2/domain/repositories/resent_otp_repository.dart';

@injectable
class ResendOtpUseCase {
 
  ResentOtpRepository resentOtpRepository;

  ResendOtpUseCase({required this.resentOtpRepository});

  Future<ResendOtpResponse> invoke({required ResendOtpRequest resendOtpRequest}){
    return resentOtpRepository.resendOtp(resendOtpRequest);
  }

}