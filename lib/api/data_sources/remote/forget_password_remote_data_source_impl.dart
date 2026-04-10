import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:por2/api/api_services.dart';
import 'package:por2/api/mappers/forget_password_request_mapper.dart';
import 'package:por2/api/mappers/forget_password_response_mapper.dart';
import 'package:por2/core/app_errors.dart';
import 'package:por2/data/data_sources/remote/forget_password_remote_data_source.dart';
import 'package:por2/domain/entities/request/forget_password_request.dart';
import 'package:por2/domain/entities/response/forget_password_response.dart';

@Injectable(as: ForgetPasswordRemoteDataSource)
class ForgetPasswordRemoteDataSourceImpl implements ForgetPasswordRemoteDataSource{

  ApiServices apiServices;

  ForgetPasswordRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<ForgetPasswordResponse> forgetPassword(ForgetPasswordRequest forgetPasswordRequest) async{
    try {
  var response=await apiServices.forgetPassword(forgetPasswordRequest.toForgetPasswordRequestDto());
  return response.toForgetPasswordResponse();
} on DioException catch (e) {
 final message=(e.error as AppErrors).errorMessage;
 throw ServerError(errorMessage: message);
}
  }
}