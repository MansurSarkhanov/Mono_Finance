import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Page createPageRoute(context, {required GoRouterState state, required Widget child}) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(seconds: 2),
    transitionsBuilder: (_, a, __, c) {
      return FadeTransition(opacity: CurveTween(curve: Curves.easeInOutCirc).animate(a), child: c);
    },
  );
}
