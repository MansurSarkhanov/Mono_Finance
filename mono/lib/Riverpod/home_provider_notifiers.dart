import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mono/Data/Domain/Repository/impl_home_repository.dart';
import 'package:mono/Data/Models/user_model.dart';

final homeStateProvider = ChangeNotifierProvider<HomeStateNotifier>((ref) {
  return HomeStateNotifier();
});

class HomeStateNotifier extends ChangeNotifier {
  List<String> items = ['Day', ' Week', "Month", "Year"];
  UserModel userModel = UserModel();
  final _homeState = ImpleHomeRepository();
  Future<void> fetchUserInfo() async {
    final user = await _homeState.fetcUserInfo();
    if (user.isSuccess()) {
      final getUser = user.tryGetSuccess();
      userModel = getUser!;
      print(userModel.email);
      notifyListeners();
    }
  }
}
