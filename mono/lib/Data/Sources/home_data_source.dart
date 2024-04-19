import 'package:mono/Config/Hive/hive_boxs_manager.dart';
import 'package:mono/Data/Models/finance_model.dart';
import 'package:mono/Data/Models/user_model.dart';

import '../../Core/Utility/Referances/firebase_collection_referance.dart';
import '../../injection.dart';

final class HomeDataSource {
  final _hiveManager = getIt.get<HiveConfigManager>();

  Future<UserModel?> fetcUserInfo() async {
    const firebaseCollection = FirebaseCollectionReferance.users;

    final userToken = await _hiveManager.readDataString(boxName: 'auth', key: 'token');
    final response = firebaseCollection.ref
        .doc(userToken)
        .withConverter(
          fromFirestore: (snapshot, options) {
            return UserModel.fromJson(snapshot.data()!);
          },
          toFirestore: (value, options) {
            return value.toJson();
          },
        )
        .get()
        .then((value) => value.data());
    return response;
  }

  Future<FinanceModel?> getUserFinance() async {
    const firebaseCollection = FirebaseCollectionReferance.finances;
    final userToken = await _hiveManager.readDataString(boxName: 'auth', key: 'token');
    final response = await firebaseCollection.ref.doc(userToken).withConverter(
      fromFirestore: (snapshot, options) {
        return FinanceModel.fromJson(snapshot.data()!);
      },
      toFirestore: (value, options) {
        return value.toJson();
      },
    ).get();

    return response.data();
  }
}
