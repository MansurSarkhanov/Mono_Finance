import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthRepository {
  Future<User?> createUserWithEmail(
      {required String email, required String password, required String username});

  Future<User?> loginUserWithEmail({required String email, required String password});
}
