
import 'package:por2/domain/entities/response/reset_code_response.dart';

abstract class ResetCodeStates {}

class ResetCodeInitState extends ResetCodeStates{}

class ResetCodeLoadingState extends ResetCodeStates{}

class ResetCodeErrorState extends ResetCodeStates{
  String message;

  ResetCodeErrorState({required this.message});
}

class ResetCodeSuccessState extends ResetCodeStates{
  
  ResetCodeResponse response;

  ResetCodeSuccessState({required this.response});


}