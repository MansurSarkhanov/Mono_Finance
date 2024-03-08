import 'package:firebase_auth/firebase_auth.dart';
import 'package:mono/Core/Contractors/auth_repository.dart';
import 'package:mono/Core/Hive/hive_boxs_manager.dart';
import 'package:mono/Data/auth_data_source.dart';
import 'package:mono/Models/user_model.dart';
import 'package:mono/Utility/Referances/firebase_collection_referance.dart';

import '../DI/injection.dart';

class ImplAuthRepository implements IAuthRepository {
  final _firebaseRef = FirebaseCollectionReferance.users.ref;
  final _authDataSource = getIt.get<AuthDataSource>();
  final _cacheManager = getIt.get<HiveBoxsManager>();

  @override
  Future<User?> createUserWithEmail({required String email, required String password, required String username}) async {
    try {
      final createUser = await _authDataSource.createUserWithEmail(email: email, password: password);
      if (createUser != null) {
        final userModel = UserModel(
          email: email,
          password: password,
          username: username,
          expenses: '0',
          income: '0',
          money: '0',
        ).toJson();
        await _firebaseRef.doc(createUser.uid).set(userModel);
        _cacheManager.saveData(boxName: "auth", key: 'token', value: createUser.uid);
        _cacheManager.saveData(boxName: "auth", key: 'logged', value: true);

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
      _cacheManager.saveData(boxName: "auth", key: 'token', value: createUser?.uid);
      _cacheManager.saveData(boxName: "auth", key: 'logged', value: true);

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

  @override
  Future<bool> checkAuth() async {
    await Future.delayed(const Duration(seconds: 2));
    print(_cacheManager.readData(boxName: 'auth', key: 'logged'));
    final isAuth = _cacheManager.readData(boxName: 'auth', key: 'logged');
    if (isAuth != null) {
      return isAuth;
    }
    return false;
  }
}
