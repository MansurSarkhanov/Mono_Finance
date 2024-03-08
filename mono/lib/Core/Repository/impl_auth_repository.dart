import 'package:firebase_auth/firebase_auth.dart';
import 'package:mono/Core/Contractors/auth_repository.dart';
import 'package:mono/Data/auth_data_source.dart';
import 'package:mono/Models/user_model.dart';
import 'package:mono/Utility/Referances/firebase_collection_referance.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../Models/failure_auth_model.dart';

class ImplAuthRepository implements IAuthRepository {
  final _firebaseRef = FirebaseCollectionReferance.users.ref;
  final _authDataSource = AuthDataSource();

  @override
  Future<Result<User, FailureAuthModel>?> createUserWithEmail(
      {required String email, required String password, required String username}) async {
    try {
      final createUser = await _authDataSource.createUserWithEmail(email: email, password: password);
      if (createUser != null) {
        final userModel = UserModel(
                email: createUser.email, password: password, username: username, expenses: '0', income: '0', money: '0')
            .toJson();
        await _firebaseRef.doc(createUser.uid).set(userModel);
        return Success(createUser);
      }
    } catch (e) {
      return Error(FailureAuthModel());
    }
    return null;
  }
}
