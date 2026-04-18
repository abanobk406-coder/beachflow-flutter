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
import 'package:por2/api/models/request/update_profile_request_dto.dart';
import 'package:por2/api/models/response/beach_dto.dart';
import 'package:por2/api/models/response/booking_dto.dart';
import 'package:por2/api/models/response/notification_dto.dart';
import 'package:por2/api/models/response/user_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: ApiEndpoints.baseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String? baseUrl}) = _ApiServices;

  @POST(ApiEndpoints.loginApi)
  Future<LoginResponseDto> login(@Body() LoginRequestDto loginRequestDto);

  @POST(ApiEndpoints.forgetPasswordApi)
  Future<ForgetPasswordResponseDto> forgetPassword(
    @Body() ForgetPasswordRequestDto forgetPasswordRequestDto,
  );

  @POST(ApiEndpoints.resetCodeApi)
  Future<ResetCodeResponseDto> verifyResetCode(
    @Body() ResetCodeRequestDto resetCodeRequestDto,
  );

  @POST(ApiEndpoints.resetPasswordApi)
  Future<ResetPasswordResponseDto> resetPassword(
    @Body() ResetPasswordRequestDto resetPasswordRequestDto,
  );

  @POST(ApiEndpoints.resendOtpApi)
  Future<ResendOtpResponseDto> resendOtp(
    @Body() ResendOtpRequestDto resentOtpRequestDto,
  );

  @GET(ApiEndpoints.getProfileApi)
  Future<UserDto> getProfile(@Header("Authorization") String token);

  @PUT(ApiEndpoints.editProfileApi)
  Future<UserDto> updateProfile(
    @Header("Authorization") String token,
    @Body() UpdateProfileRequestDto body,
  );

  @GET(ApiEndpoints.favoritesApi)
  Future<List<BeachDto>> getFavorites(@Header("Authorization") String token);

  @POST(ApiEndpoints.toggleFavoriteApi)
  Future<void> toggleFavorite(
    @Header("Authorization") String token,
    @Body() Map<String, dynamic> body,
  );

  @GET(ApiEndpoints.myNotificationsApi)
  Future<List<NotificationDto>> getMyNotifications(
    @Header("Authorization") String token,
  );

  @GET(ApiEndpoints.myBookingsApi)
  Future<List<BookingDto>> getMyBookings(
    @Header("Authorization") String token,
  );

  @POST(ApiEndpoints.requestAdminApi)
  Future<void> requestAdmin(
    @Header("Authorization") String token,
    @Body() Map<String, dynamic> body,
  );
}
