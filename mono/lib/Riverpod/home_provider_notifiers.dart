import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mono/Data/Domain/Repository/impl_home_repository.dart';
import 'package:mono/Data/Models/finance_model.dart';
import 'package:mono/Data/Models/user_model.dart';

final homeStateProvider = ChangeNotifierProvider<HomeStateNotifier>((ref) {
  return HomeStateNotifier();
});

class HomeStateNotifier extends ChangeNotifier {
  final _homeState = ImpleHomeRepository();

  List<String> items = ['Day', ' Week', "Month", "Year"];
  UserModel userModel = UserModel();
  FinanceModel? currentFinance;
  bool isFinanceLoading = true;
  bool isUserLoading = true;

  Future<void> fetchUserInfo() async {
    final user = await _homeState.fetcUserInfo();
    if (user.isSuccess()) {
      final getUser = user.tryGetSuccess();
      userModel = getUser!;
      isUserLoading = false;
      notifyListeners();
    }
  }

  Future<bool?> getUserFinance() async {
    final result = await _homeState.getUserFinance();
    if (result.isSuccess()) {
      final finance = result.tryGetSuccess();

      if (finance != null) {
        currentFinance = finance;
        print('sdfsfsdf');
        isFinanceLoading = false;
        notifyListeners();
      } else {
        isFinanceLoading = false;
        
      }
    }
    return null;
  }
}
