import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:por2/api/api_services.dart';
import 'package:por2/api/mappers/reset_password_request_mapper.dart';
import 'package:por2/api/mappers/reset_password_response_mapper.dart';
import 'package:por2/core/app_errors.dart';
import 'package:por2/data/data_sources/remote/reset_password_remote_data_source.dart';
import 'package:por2/domain/entities/request/reset_password_request.dart';
import 'package:por2/domain/entities/response/reset_password_response.dart';

@Injectable(as: ResetPasswordRemoteDataSource)
class ResetPasswordRemoteDataSourceImpl implements ResetPasswordRemoteDataSource{

  ApiServices apiServices;

  ResetPasswordRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<ResetPasswordResponse> resetPassword(ResetPasswordRequest resetPasswordRequest) async{
     
     try {
  var response=await apiServices.resetPassword(resetPasswordRequest.toResetPasswordRequestDto());
  return response.toResetPasswordResponse();
} on DioException catch (e) {
  if (e.error is AppErrors) {
    throw e.error as AppErrors;
  }
  throw ServerError(errorMessage: e.message ?? 'Something went wrong');
}
  }
}