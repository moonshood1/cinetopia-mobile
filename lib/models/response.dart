class LoginResponse {
  final bool success;
  final String message;
  final String token;

  LoginResponse({
    required this.success,
    required this.message,
    required this.token,
  });
}

class BasicResponse {
  final bool success;
  final String message;

  BasicResponse({
    required this.success,
    required this.message,
  });
}
