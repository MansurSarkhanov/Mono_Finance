import 'package:firebase_auth/firebase_auth.dart';

final class AuthDataSource {
  final _firebaseAuth = FirebaseAuth.instance;

  Future<User?> createUserWithEmail({required String email, required String password}) async {
    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    if (userCredential.user != null) {
      final user = userCredential.user;
      return user;
    }
    return null;
  }

  Future<User?> loginUserWithEmail({required String email, required String password}) async {
    final userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);

    if (userCredential.user != null) {
      final user = userCredential.user;
      return user;
    }
    return null;
  }

}
