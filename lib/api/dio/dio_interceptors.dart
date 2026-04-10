import 'package:dio/dio.dart';
import 'package:por2/core/app_errors.dart';

class DioInterceptors extends Interceptor{

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
   
  AppErrors appErrors;

  String message='something went wrong, please tru again';
   
   
   if(err.response!=null && err.response!.data is Map){

    final responseData=err.response!.data as Map;

    message =(responseData['message'] as String?)??message;
   }
   if(err.type==DioExceptionType.connectionError ||err.type==DioExceptionType.connectionTimeout){
    appErrors=NetworkError(errorMessage: 'No Internet Connection');
   } else if(err.response!=null ){
    appErrors=ServerError(errorMessage: message);
   }else{
    appErrors=UnExpectedError(errorMessage: message);
   }
   

   handler.next(
    DioException(
      requestOptions: err.requestOptions,
      error: appErrors,
      message: appErrors.errorMessage,
      response: err.response,
      type: err.type));


  }
}