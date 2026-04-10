
import 'package:por2/domain/entities/response/user.dart';

class LoginResponse{

  final String? token;
 
  final User? user;

  LoginResponse ({
    this.token,
    this.user,
  });

}


