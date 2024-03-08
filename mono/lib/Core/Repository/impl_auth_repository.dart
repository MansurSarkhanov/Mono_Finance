import 'package:firebase_auth/firebase_auth.dart';
import 'package:mono/Core/Contractors/auth_repository.dart';
import 'package:mono/Data/auth_data_source.dart';
import 'package:mono/Models/user_model.dart';
import 'package:mono/Utility/Referances/firebase_collection_referance.dart';

class ImplAuthRepository implements IAuthRepository {
  final _firebaseRef = FirebaseCollectionReferance.users.ref;
  final _authDataSource = AuthDataSource();

  @override
  Future<User?> createUserWithEmail({required String email, required String password, required String username}) async {
    try {
      final createUser = await _authDataSource.createUserWithEmail(email: email, password: password);
      if (createUser != null) {
        final userModel =
            UserModel(email: email, password: password, username: username, expenses: '0', income: '0', money: '0')
                .toJson();
        await _firebaseRef.doc(createUser.uid).set(userModel);
        return createUser;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  @override
  Future<User?> loginUserWithEmail({required String email, required String password}) async {
    try {
      final createUser = await _authDataSource.loginUserWithEmail(email: email, password: password);
      print(createUser?.uid);
      return createUser;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
