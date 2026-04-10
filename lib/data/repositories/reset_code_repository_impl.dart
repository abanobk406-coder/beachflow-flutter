import 'package:injectable/injectable.dart';
import 'package:por2/data/data_sources/remote/reset_code_resmot_data_source.dart';
import 'package:por2/domain/entities/request/reset_code_request.dart';
import 'package:por2/domain/entities/response/reset_code_response.dart';
import 'package:por2/domain/repositories/reset_code_repository.dart';

@Injectable(as: ResetCodeRepository)
class ResetCodeRepositoryImpl implements ResetCodeRepository{

  ResetCodeResmotDataSource resetCodeResmotDataSource;

  ResetCodeRepositoryImpl({required this.resetCodeResmotDataSource});

  @override
  Future<ResetCodeResponse> verifyResetCode(ResetCodeRequest resetCodeRequest) {
     return resetCodeResmotDataSource.verifyResetCode(resetCodeRequest);
  }
}