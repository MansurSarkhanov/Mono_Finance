import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mono/Data/Domain/Repository/impl_auth_repository.dart';

final authProvider = Provider<ImplAuthRepository>((ref) => ImplAuthRepository());
final authProviderRef = FutureProvider<ImplAuthRepository>((ref) {
  return ref.watch(authProvider);
});

final checkProvider = StateNotifierProvider((ref) {
  return CheckStateNotifier();
});

class CheckStateNotifier extends StateNotifier<bool?> {
  CheckStateNotifier() : super(false);
  final _authState = ImplAuthRepository();
  Future<bool?> checkAuth() async {
    state = await _authState.checkAuth();
    return state;
  }
}
