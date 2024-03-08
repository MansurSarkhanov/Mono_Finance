import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mono/Core/Repository/impl_auth_repository.dart';

final authProvider = Provider<ImplAuthRepository>((ref) => ImplAuthRepository());
final authProviderRef = FutureProvider<ImplAuthRepository>((ref) {
  return ref.watch(authProvider);
});

