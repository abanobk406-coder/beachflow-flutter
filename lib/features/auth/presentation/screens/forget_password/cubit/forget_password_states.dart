import 'package:por2/domain/entities/response/forget_password_response.dart';

abstract class ForgetPasswordStates {}

class ForgetPasswordInitState extends ForgetPasswordStates {}

class ForgetPasswordLoadingState extends ForgetPasswordStates {}

class ForgetPasswordErrorState extends ForgetPasswordStates {
  String message;

  ForgetPasswordErrorState({required this.message});
}

class ForgetPasswordSuccessState extends ForgetPasswordStates {
  ForgetPasswordResponse response;

  ForgetPasswordSuccessState({required this.response});
}
