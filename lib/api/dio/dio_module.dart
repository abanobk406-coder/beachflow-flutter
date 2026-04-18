import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:por2/api/api_endpoints.dart';
import 'package:por2/api/api_services.dart';
import 'package:por2/api/dio/dio_interceptors.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class GetItModule{

 @singleton
 @injectable
 BaseOptions provideBaseOptions(){
  return BaseOptions(
    baseUrl: ApiEndpoints.baseUrl,
    receiveDataWhenStatusError: true,
    connectTimeout: Duration(seconds: 20),
    receiveTimeout: Duration(seconds: 20),
    sendTimeout: Duration(seconds: 20)
  );
 }

 @singleton
 @injectable
 PrettyDioLogger providePrettyDioLogger(){
  return PrettyDioLogger(
    request: true,
    requestBody: true,
    responseBody: true,
    requestHeader: true,
    responseHeader: true,
    error: true
  );
 }

 @singleton
 @injectable
 Dio provideDio(BaseOptions baseOptions,PrettyDioLogger prettyDioLogger){
  
    var dio=Dio(baseOptions);
    dio.interceptors.add(DioInterceptors());
    dio.interceptors.add(prettyDioLogger);
    return dio;
  
 }


 @singleton
 @injectable
 ApiServices provideApiServices(Dio dio){
  return ApiServices(dio);
 }

}