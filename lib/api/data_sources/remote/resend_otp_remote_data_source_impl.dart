import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:por2/api/api_services.dart';
import 'package:por2/api/mappers/resend_opt_response_mapper.dart';
import 'package:por2/api/mappers/resent_opt_request_mapper.dart';
import 'package:por2/core/app_errors.dart';
import 'package:por2/data/data_sources/remote/resend_otp_remote_data_source.dart';
import 'package:por2/domain/entities/request/resend_otp_request.dart';
import 'package:por2/domain/entities/response/resend_otp_response.dart';

@Injectable(as: ResendOtpRemoteDataSource)
class ResendOtpRemoteDataSourceImpl implements ResendOtpRemoteDataSource{


  ApiServices apiServices;

  ResendOtpRemoteDataSourceImpl({required this.apiServices});
  @override
  Future<ResendOtpResponse> resendOtp(ResendOtpRequest resendOtpRequest) async{
    try {
  var response=await apiServices.resendOtp(resendOtpRequest.toResendOtpRequestDto());
  return response.toResendOtpResponse();
} on DioException catch (e) {
  final message=(e.error as AppErrors).errorMessage;
  throw ServerError(errorMessage: message);
}
  }
}