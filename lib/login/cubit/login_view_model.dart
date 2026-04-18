import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:por2/core/app_errors.dart';
import 'package:por2/domain/entities/request/login_request.dart';
import 'package:por2/domain/use_case/login_use_case.dart';
import 'package:por2/login/cubit/login_states.dart';

@injectable
class LoginViewModel extends Cubit<LoginStates>{

 LoginUseCase loginUseCase;

  LoginViewModel({required this.loginUseCase}):super(LoginInitState());
 
 final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  
 Future<void> login()async{

    
      if(formKey.currentState!.validate()){
        try {
  emit(LoginLoadingState());
    
    LoginRequest loginRequest=LoginRequest(email: emailController.text,password: passwordController.text);
    
  var loginResponse=await loginUseCase.invoke(loginRequest: loginRequest);
    
  emit(LoginSuccessState(loginResponse: loginResponse));
} on AppErrors catch (e) {
  emit(LoginErrorState(message: e.errorMessage));
} on DioException catch (e) {
  final message = (e.error is AppErrors)
      ? (e.error as AppErrors).errorMessage
      : (e.message ?? 'حدث خطأ غير متوقع');
  emit(LoginErrorState(message: message));
} catch (e) {
  emit(LoginErrorState(message: 'حدث خطأ غير متوقع'));
}
      }
 
  

  }

}