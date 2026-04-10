import 'package:injectable/injectable.dart';
import 'package:por2/data/data_sources/remote/forget_password_remote_data_source.dart';
import 'package:por2/domain/entities/request/forget_password_request.dart';
import 'package:por2/domain/entities/response/forget_password_response.dart';
import 'package:por2/domain/repositories/forget_password_repository.dart';

@Injectable(as: ForgetPasswordRepository)
class ForgetPasswordRepositoryImpl implements ForgetPasswordRepository{

  ForgetPasswordRemoteDataSource forgetPasswordRemoteDataSource;
 

  ForgetPasswordRepositoryImpl({required this.forgetPasswordRemoteDataSource});

  @override
  Future<ForgetPasswordResponse> forgetPassword(ForgetPasswordRequest forgetPasswordRequest) {
    return forgetPasswordRemoteDataSource.forgetPassword(forgetPasswordRequest);
  }
}