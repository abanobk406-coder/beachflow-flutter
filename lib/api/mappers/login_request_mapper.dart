import 'package:por2/api/models/request/login_request_dto.dart';
import 'package:por2/domain/entities/request/login_request.dart';

extension LoginRequestMapper on LoginRequest {
  LoginRequestDto toLoginRequestDto(){
    return LoginRequestDto(email: email,password: password);
  }
}