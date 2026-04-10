import 'package:injectable/injectable.dart';
import 'package:por2/domain/entities/request/reset_code_request.dart';
import 'package:por2/domain/entities/response/reset_code_response.dart';
import 'package:por2/domain/repositories/reset_code_repository.dart';

@injectable
class ResetCodeUseCase {

 ResetCodeRepository resetCodeRepository;

 ResetCodeUseCase({required this.resetCodeRepository});


 Future<ResetCodeResponse> invoke({required ResetCodeRequest resetCodeRequest}){

  return resetCodeRepository.verifyResetCode(resetCodeRequest);
 }

}