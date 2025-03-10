abstract class AuthEvents {}

class SignInRequest extends AuthEvents {
  final String password;
  final String email;

  SignInRequest({
    required this.email,
    required this.password,
  });
}

class SignUpRequest extends AuthEvents {
  final String password;
  final String email;
  final String name;
  SignUpRequest({
    required this.email,
    required this.password,
    required this.name,
  });
}

class LogOutRequest extends AuthEvents {}
