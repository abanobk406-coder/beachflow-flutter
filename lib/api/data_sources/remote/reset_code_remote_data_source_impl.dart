import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:por2/api/api_services.dart';
import 'package:por2/api/mappers/reset_code_request_mapper.dart';
import 'package:por2/api/mappers/reset_code_response_mapper.dart';
import 'package:por2/core/app_errors.dart';
import 'package:por2/data/data_sources/remote/reset_code_resmot_data_source.dart';
import 'package:por2/domain/entities/request/reset_code_request.dart';
import 'package:por2/domain/entities/response/reset_code_response.dart';


@Injectable(as: ResetCodeResmotDataSource)
class ResetCodeRemoteDataSourceImpl implements ResetCodeResmotDataSource{

  ApiServices apiServices;

  ResetCodeRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<ResetCodeResponse> verifyResetCode(ResetCodeRequest resetCodeRequest) async{
    try {
  var response=await apiServices.verifyResetCode(resetCodeRequest.toResetCodeRequestDto());
  return response.toResetCodeResponse();
} on DioException catch (e) {
  if (e.error is AppErrors) {
    throw e.error as AppErrors;
  }
  throw ServerError(errorMessage: e.message ?? 'Something went wrong');
}
  }
}