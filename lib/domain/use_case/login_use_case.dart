import 'package:injectable/injectable.dart';
import 'package:por2/domain/entities/request/login_request.dart';
import 'package:por2/domain/entities/response/login_response.dart';
import 'package:por2/domain/repositories/login_repository.dart';

@injectable
class LoginUseCase {

  LoginRepository loginRepository;

  LoginUseCase({required this.loginRepository});

  Future<LoginResponse> invoke({required LoginRequest loginRequest}){
    return loginRepository.login(loginRequest);
  }

}