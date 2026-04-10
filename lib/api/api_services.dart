import 'package:dio/dio.dart';
import 'package:por2/api/api_endpoints.dart';
import 'package:por2/api/models/request/forget_password_request_dto.dart';
import 'package:por2/api/models/request/login_request_dto.dart';
import 'package:por2/api/models/request/resend_otp_request_dto.dart';
import 'package:por2/api/models/request/reset_code_request_dto.dart';
import 'package:por2/api/models/request/reset_password_request_dto.dart';
import 'package:por2/api/models/response/forget_password_response_dto.dart';
import 'package:por2/api/models/response/login_response_dto.dart';
import 'package:por2/api/models/response/resend_otp_response_dto.dart';
import 'package:por2/api/models/response/reset_code_response_dto.dart';
import 'package:por2/api/models/response/reset_password_response_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: ApiEndpoints.baseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String? baseUrl}) = _ApiServices;

  @POST(ApiEndpoints.loginApi)
  Future<LoginResponseDto> login(@ Body() LoginRequestDto loginRequestDto );

   @POST(ApiEndpoints.forgetPasswordApi)
   Future<ForgetPasswordResponseDto> forgetPassword(@ Body() ForgetPasswordRequestDto forgetPasswordRequestDto);
  
   @POST(ApiEndpoints.resetCodeApi)
   Future<ResetCodeResponseDto> verifyResetCode(@Body() ResetCodeRequestDto resetCodeRequestDto);
  

  @POST(ApiEndpoints.resetPasswordApi)

  Future<ResetPasswordResponseDto> resetPassword(@Body() ResetPasswordRequestDto resetPasswordRequestDto);

  @POST(ApiEndpoints.resendOtpApi)
  Future<ResendOtpResponseDto> resendOtp(@Body() ResendOtpRequestDto resentOtpRequestDto);
}

