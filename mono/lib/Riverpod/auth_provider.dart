import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mono/Core/Repository/impl_auth_repository.dart';

final authProvider = Provider<ImplAuthRepository>((ref) => ImplAuthRepository());
final authProviderRef = FutureProvider<ImplAuthRepository>((ref) {
  return ref.watch(authProvider);
});

class SplashCheckProvider extends ChangeNotifier {
  final _authRepo = ImplAuthRepository();
  bool isSplash = false;

  Future<bool> checkAuth() async {
    isSplash = await _authRepo.checkAuth();
    print(isSplash);
    return isSplash;
  }
}
