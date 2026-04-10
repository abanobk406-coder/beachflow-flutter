import 'package:injectable/injectable.dart';
import 'package:por2/domain/entities/request/forget_password_request.dart';
import 'package:por2/domain/entities/response/forget_password_response.dart';
import 'package:por2/domain/repositories/forget_password_repository.dart';

@injectable
class ForgetPasswordUseCase {
 
 ForgetPasswordRepository forgetPasswordRepository;

 ForgetPasswordUseCase({required this.forgetPasswordRepository});


 Future<ForgetPasswordResponse> invoke({required ForgetPasswordRequest forgetPasswordRequest}){
  return forgetPasswordRepository.forgetPassword(forgetPasswordRequest);
 }

}