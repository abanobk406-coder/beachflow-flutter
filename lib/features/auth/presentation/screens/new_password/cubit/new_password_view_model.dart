import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:por2/core/app_errors.dart';
import 'package:por2/domain/entities/request/reset_password_request.dart';
import 'package:por2/domain/use_case/reset_password_use_case.dart';
import 'package:por2/features/auth/presentation/screens/new_password/cubit/new_password_states.dart';



@injectable
class NewPasswordViewModel extends Cubit<NewPasswordStates>{

  ResetPasswordUseCase resetPasswordUseCase;

  NewPasswordViewModel({required this.resetPasswordUseCase}):super(NewPasswordInitState());
  
  TextEditingController passwordController=TextEditingController();

  GlobalKey<FormState> formKey=GlobalKey();
  
  resetPassword({required String email})async{
    if (formKey.currentState!.validate()) {
  try {
  emit(NewPasswordLoadingState());
  
  ResetPasswordRequest resetPasswordRequest=ResetPasswordRequest(email: email,newPassword: passwordController.text);
  
  var response=await resetPasswordUseCase.invoke(resetPasswordRequest: resetPasswordRequest);
  emit(NewPasswordSuccessState(response: response));
} on AppErrors catch (e) {

  emit(NewPasswordErrorState(message: e.errorMessage));
}on DioException catch(e){

  String? message=(e.error is AppErrors)?(e.error as AppErrors).errorMessage:e.message;
  
  emit(NewPasswordErrorState(message: message??'UnExpected Error Occurred'));

}
}
    
  }


}