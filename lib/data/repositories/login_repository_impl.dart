import 'package:injectable/injectable.dart';
import 'package:por2/data/data_sources/remote/login_remote_data_source.dart';
import 'package:por2/domain/entities/request/login_request.dart';
import 'package:por2/domain/entities/response/login_response.dart';
import 'package:por2/domain/repositories/login_repository.dart';

@Injectable(as: LoginRepository)
class LoginRepositoryImpl implements LoginRepository{

  LoginRemoteDataSource loginRemoteDataSource;

  LoginRepositoryImpl({required this.loginRemoteDataSource});

  @override
  Future<LoginResponse> login(LoginRequest loginRequest) {
   return loginRemoteDataSource.login(loginRequest);
  }
}