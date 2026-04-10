import 'package:por2/api/mappers/user_mapper.dart';
import 'package:por2/api/models/response/login_response_dto.dart';
import 'package:por2/domain/entities/response/login_response.dart';

extension LoginResponseMapper on LoginResponseDto{
  LoginResponse toLoginResponse(){
    return LoginResponse(
      token: token,
      user: user!.toUser()
    );
  }
}