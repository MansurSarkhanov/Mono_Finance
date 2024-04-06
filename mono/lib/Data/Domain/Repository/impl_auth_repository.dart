import 'package:firebase_auth/firebase_auth.dart';
import 'package:mono/Config/Hive/hive_boxs_manager.dart';
import 'package:mono/Core/Utility/Referances/firebase_collection_referance.dart';
import 'package:mono/Data/Domain/Contractors/auth_repository.dart';
import 'package:mono/Data/Models/user_model.dart';
import 'package:mono/Data/Sources/auth_data_source.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../injection.dart';
import '../../Models/failure_auth_model.dart';

class ImplAuthRepository implements IAuthRepository {
  final _firebaseRef = FirebaseCollectionReferance.users.ref;
  final _authDataSource = getIt.get<AuthDataSource>();
  final _cacheManager = getIt.get<HiveConfigManager>();

  @override
  Future<Result<User, FailureAuthModel>?> createUserWithEmail(
      {required String email, required String password, required String username}) async {
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

        return Success(createUser);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return Error(FailureAuthModel(message: e.toString()));
      } else if (e.code == 'wrong-password') {
        return Error(FailureAuthModel(message: e.toString()));
      }
    } catch (e) {
      return Error(FailureAuthModel(message: e.toString()));
    }
    return Error(FailureAuthModel(message: "Check your email and password"));
  }

  @override
  Future<Result<User, FailureAuthModel>?> loginUserWithEmail({required String email, required String password}) async {
    try {
      final createUser = await _authDataSource.loginUserWithEmail(email: email, password: password);
      _cacheManager.saveData(boxName: "auth", key: 'token', value: createUser?.uid);
      _cacheManager.saveData(boxName: "auth", key: 'logged', value: true);

      return Success(createUser!);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return Error(FailureAuthModel(message: e.toString()));
      } else if (e.code == 'wrong-password') {
        return Error(FailureAuthModel(message: e.toString()));
      }
    } catch (e) {
      return Error(FailureAuthModel(message: e.toString()));
    }
    return Error(FailureAuthModel(message: "Check your email and password"));
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
