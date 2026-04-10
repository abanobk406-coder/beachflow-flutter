import 'package:injectable/injectable.dart';
import 'package:por2/data/data_sources/remote/reset_password_remote_data_source.dart';
import 'package:por2/domain/entities/request/reset_password_request.dart';
import 'package:por2/domain/entities/response/reset_password_response.dart';
import 'package:por2/domain/repositories/reset_password_repository.dart';

@Injectable(as: ResetPasswordRepository)
class ResetPasswordRepositoryImpl  implements ResetPasswordRepository{

  ResetPasswordRemoteDataSource resetPasswordRemoteDataSource;

  ResetPasswordRepositoryImpl({required this.resetPasswordRemoteDataSource});

  @override
  Future<ResetPasswordResponse> resetPassword(ResetPasswordRequest resetPasswordRequest) {
   return resetPasswordRemoteDataSource.resetPassword(resetPasswordRequest);
  }
}