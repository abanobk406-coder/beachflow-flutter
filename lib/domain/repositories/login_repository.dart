import 'package:por2/domain/entities/request/login_request.dart';
import 'package:por2/domain/entities/response/login_response.dart';

abstract class LoginRepository {
  Future<LoginResponse> login(LoginRequest loginRequest);
}