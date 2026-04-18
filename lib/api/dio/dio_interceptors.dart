import 'package:dio/dio.dart';
import 'package:por2/core/app_errors.dart';

class DioInterceptors extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    AppErrors appErrors;

    String message = 'شيء ما سار بشكل خاطئ، يرجى المحاولة مرة أخرى';

    if (err.response != null && err.response!.data is Map) {
      final responseData = err.response!.data as Map;
      message = (responseData['message'] as String?) ?? message;
    }

    if (err.type == DioExceptionType.connectionError ||
        err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.sendTimeout ||
        err.type == DioExceptionType.receiveTimeout) {
      appErrors = NetworkError(errorMessage: 'فشل في الاتصال بالخادم، يرجى التأكد من الإنترنت');
    } else if (err.response != null) {
      appErrors = ServerError(errorMessage: message);
    } else {
      appErrors = UnExpectedError(errorMessage: 'حدث خطأ غير متوقع، يرجى المحاولة لاحقاً');
    }

    handler.next(
      DioException(
        requestOptions: err.requestOptions,
        error: appErrors,
        message: appErrors.errorMessage,
        response: err.response,
        type: err.type,
      ),
    );
  }
}