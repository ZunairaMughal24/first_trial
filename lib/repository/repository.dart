import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_trial/services/firebase_Services.dart';

class AuthRepository {
  final FirebaseAuthService _authService;

  AuthRepository(this._authService);

  Future<User?> signUp(String email, String password) async {
    return await _authService.createUserWithEmailAndPassword(email, password);
  }

 

  Future<void> logout() async {
    await _authService.signOut();
  }
}
