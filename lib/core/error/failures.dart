abstract class Failure {
  final String message;
  Failure(this.message);
}

// General failure
class ServerFailure extends Failure {
  ServerFailure([String message = "Server Failure"]) : super(message);
}

class NetworkFailure extends Failure {
  NetworkFailure([String message = "No Internet Connection"]) : super(message);
}

class AuthFailure extends Failure {
  AuthFailure([String message = "Authentication Error"]) : super(message);
}

class UnexpectedFailure extends Failure {
  UnexpectedFailure([String message = "Unexpected Error Occurred"])
    : super(message);
}
