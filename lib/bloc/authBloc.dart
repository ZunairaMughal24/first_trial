import 'package:first_trial/bloc/events.dart';

import 'package:first_trial/bloc/states.dart';
import 'package:first_trial/repository/repository.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class Authbloc extends Bloc<AuthEvents, AuthStates> {
  final AuthRepository _authRepository;
  Authbloc(this._authRepository) : super(InitialState()) {
    on<LogInRequest>(logIn);
    on<LogOutRequest>(logOut);
  }
  Future<void> logIn(LogInRequest event, Emitter<AuthStates> emit) async {
    try {
      emit(LoadingState());
      final user = await _authRepository.login(event.email, event.password);
      if (user != null) {
        emit(AuthenticatedState(userEmail: user.email!));
      } else {
        emit(FailureState(error: "invalid email or password"));
      }
    } catch (e) {
      emit(FailureState(error: e.toString()));
    }
  }

  Future<void> logOut(LogOutRequest event, Emitter<AuthStates> emit) async {
    await _authRepository.logout();
    emit(InitialState());
  }
}
