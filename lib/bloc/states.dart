abstract class AuthStates {}

class InitialState extends AuthStates {}

class LoadingState extends AuthStates {}

class AuthenticatedState extends AuthStates {
  final String userEmail;
  
  AuthenticatedState({required this.userEmail});
}

class FailureState extends AuthStates {
  final String error;
  FailureState({required this.error});
}

class LogOutState extends AuthStates {}
