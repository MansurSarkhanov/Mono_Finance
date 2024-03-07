import 'package:firebase_auth/firebase_auth.dart';
import 'package:mono/Models/failure_auth_model.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class IAuthRepository {
  Future<Result<User, FailureAuthModel>> createUserWithEmail(
      {required String email, required String password, required String username});
}
