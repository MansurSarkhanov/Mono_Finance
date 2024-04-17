import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mono/Data/Domain/Repository/impl_auth_repository.dart';
import 'package:mono/app_routes.dart';

final authProvider = Provider<ImplAuthRepository>((ref) => ImplAuthRepository());
final authProviderRef = FutureProvider<ImplAuthRepository>((ref) {
  return ref.watch(authProvider);
});



class CheckStateNotifier extends StateNotifier<bool?> {
  CheckStateNotifier() : super(false);
  final _authState = ImplAuthRepository();
  void checkAuth() async {
    state = await _authState.checkAuth();
    final goState = state;
    if (goState == true) {
      router.go("/home");
    } else {
      router.go("/onboarding");
    }
  }
}
