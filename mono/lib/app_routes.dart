import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mono/Presentation/Screens/Home/home_page.dart';
import 'package:mono/Presentation/Screens/Login/login_page.dart';
import 'package:mono/Presentation/Screens/Register/register_page.dart';
import 'package:mono/Presentation/Screens/Splash/splash_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const SplashPage(),
        transitionDuration: const Duration(seconds: 2),
        transitionsBuilder: (_, a, __, c) {
          return FadeTransition(opacity: CurveTween(curve: Curves.easeInOutCirc).animate(a), child: c);
        },
      ),
    ),
    GoRoute(
      path: '/login',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: LoginPage(),
        transitionDuration: const Duration(seconds: 2),
        transitionsBuilder: (_, a, __, c) {
          return FadeTransition(opacity: CurveTween(curve: Curves.easeInOutCirc).animate(a), child: c);
        },
      ),
    ),
    GoRoute(
      path: '/register',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        transitionDuration: const Duration(seconds: 2),
        child: RegisterPage(),
        transitionsBuilder: (_, a, __, c) {
          return FadeTransition(opacity: CurveTween(curve: Curves.easeInOutCirc).animate(a), child: c);
        },
      ),
    ),
    GoRoute(
      path: '/home',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const HomePage(),
        transitionDuration: const Duration(seconds: 2),
        transitionsBuilder: (_, a, __, c) {
          return FadeTransition(opacity: CurveTween(curve: Curves.easeInOutCirc).animate(a), child: c);
        },
      ),
    ),
  ],
);
