abstract class AuthEvents {}

class LogInRequest extends AuthEvents {
  final String password;
  final String email;

  LogInRequest({
    required this.email,
    required this.password,
  });
}

class LogOutRequest extends AuthEvents {}
