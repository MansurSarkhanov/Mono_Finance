import 'package:firebase_auth/firebase_auth.dart';
import 'package:mono/Core/Utility/Referances/firebase_collection_referance.dart';
import 'package:mono/Data/Domain/Contractors/auth_repository.dart';
import 'package:mono/Data/Models/user_model.dart';
import 'package:mono/Data/Sources/auth_data_source.dart';
import 'package:mono/Hive/hive_boxs_manager.dart';

import '../../../injection.dart';

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
  Future<bool?> checkAuth() async {
    await Future.delayed(const Duration(seconds: 4));
    final isAuth = await _cacheManager.readDataBool(boxName: 'auth', key: 'logged');
    final token = await _cacheManager.readDataString(boxName: 'auth', key: 'token');
    print(token);
    if (isAuth == true) {
      return true;
    }
    return false;
  }
}
