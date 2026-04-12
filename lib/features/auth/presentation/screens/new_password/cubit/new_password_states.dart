import 'package:por2/domain/entities/response/reset_password_response.dart';

abstract class NewPasswordStates {}

class NewPasswordInitState extends NewPasswordStates {}

class NewPasswordLoadingState extends NewPasswordStates {}

class NewPasswordErrorState extends NewPasswordStates {
  String message;

  NewPasswordErrorState({required this.message});
}

class NewPasswordSuccessState extends NewPasswordStates {
  ResetPasswordResponse response;

  NewPasswordSuccessState({required this.response});
}
