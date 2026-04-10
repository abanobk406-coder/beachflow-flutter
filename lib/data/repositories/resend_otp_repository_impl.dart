import 'package:injectable/injectable.dart';
import 'package:por2/data/data_sources/remote/resend_otp_remote_data_source.dart';
import 'package:por2/domain/entities/request/resend_otp_request.dart';
import 'package:por2/domain/entities/response/resend_otp_response.dart';
import 'package:por2/domain/repositories/resent_otp_repository.dart';

@Injectable(as: ResentOtpRepository)
class ResendOtpRepositoryImpl implements ResentOtpRepository{

 ResendOtpRemoteDataSource resendOtpRemoteDataSource;

 ResendOtpRepositoryImpl({required this.resendOtpRemoteDataSource});

  @override
  Future<ResendOtpResponse> resendOtp(ResendOtpRequest resendOtpRequest) {
    return resendOtpRemoteDataSource.resendOtp(resendOtpRequest);
  }
 
}