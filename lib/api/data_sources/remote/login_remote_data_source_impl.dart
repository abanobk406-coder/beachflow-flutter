import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:por2/api/api_services.dart';
import 'package:por2/api/mappers/login_request_mapper.dart';
import 'package:por2/api/mappers/login_response_mapper.dart';
import 'package:por2/core/app_errors.dart';
import 'package:por2/data/data_sources/remote/login_remote_data_source.dart';
import 'package:por2/domain/entities/request/login_request.dart';
import 'package:por2/domain/entities/response/login_response.dart';

@Injectable(as: LoginRemoteDataSource)
class LoginRemoteDataSourceImpl implements LoginRemoteDataSource{

 ApiServices apiServices;

 LoginRemoteDataSourceImpl({required this.apiServices});


  @override
  Future<LoginResponse> login(LoginRequest loginRequest) async{
    
   try {
  var loginResponse=await apiServices.login(loginRequest.toLoginRequestDto());  
  
  return loginResponse.toLoginResponse();
} on DioException catch (e) {
  String message=(e.error as AppErrors).errorMessage;
  throw ServerError(errorMessage: message);
}



  }
}