import 'package:firebase_auth/firebase_auth.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../Models/failure_auth_model.dart';

abstract interface class IAuthRepository {
  Future<Result<User, FailureAuthModel>?> createUserWithEmail(
      {required String email, required String password, required String username});

  Future<Result<User, FailureAuthModel>?> loginUserWithEmail({required String email, required String password});
  Future<bool?> checkAuth();

}
