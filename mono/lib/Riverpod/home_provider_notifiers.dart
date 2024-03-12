import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mono/Data/Domain/Repository/impl_home_repository.dart';

import '../Data/Models/user_model.dart';

final homeStateProvider = StateNotifierProvider((ref) {
  return HomeStateNotifier();
});

class HomeStateNotifier extends StateNotifier<UserModel> {
  HomeStateNotifier() : super(UserModel(email: "Empty"));

  final _homeState = ImpleHomeRepository();
  Future<void> fetchUserInfo() async {
    final user = await _homeState.fetcUserInfo();
    print('correct');
    if (user.isSuccess()) {
      final userModel = user.tryGetSuccess();
      if (userModel != null) {
        print('change state');

        state = userModel;
      }
    }
  }
}
