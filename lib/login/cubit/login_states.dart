import 'package:por2/domain/entities/response/login_response.dart';

abstract class LoginStates {

}

class LoginInitState extends LoginStates{

}


class LoginLoadingState extends LoginStates{

}

class LoginErrorState extends LoginStates{
  String message;

  LoginErrorState({required this.message});
}

class LoginSuccessState extends LoginStates{
  LoginResponse loginResponse;

  LoginSuccessState({required this.loginResponse});
}