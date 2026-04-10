class AppErrors implements Exception {


 String errorMessage;
 int?statusCode; 
 AppErrors({required this.errorMessage,this.statusCode});

}


class ServerError extends AppErrors{
  ServerError({required super.errorMessage,super.statusCode});

}

class NetworkError extends AppErrors{
  NetworkError({required super.errorMessage,super.statusCode});

}

class UnExpectedError extends AppErrors{
  UnExpectedError({required super.errorMessage,super.statusCode});

}