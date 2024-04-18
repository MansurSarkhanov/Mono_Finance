import 'package:go_router/go_router.dart';
import 'package:mono/Presentation/Animations/page_route.dart';
import 'package:mono/Presentation/Screens/Home/home_page.dart';
import 'package:mono/Presentation/Screens/Login/login_page.dart';
import 'package:mono/Presentation/Screens/Onboarding/onboarding_page.dart';
import 'package:mono/Presentation/Screens/Register/register_page.dart';
import 'package:mono/Presentation/Screens/Splash/splash_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => createPageRoute(context, state: state, child: const SplashPage()),
    ),
    GoRoute(
        path: '/onboarding',
        pageBuilder: (context, state) => createPageRoute(context, state: state, child: const OnboardingPage())
    ),
    GoRoute(
      path: '/login',
        pageBuilder: (context, state) => createPageRoute(context, state: state, child: const LoginPage())
    ),
    GoRoute(
      path: '/register',
        pageBuilder: (context, state) => createPageRoute(context, state: state, child: const RegisterPage())

    ),
    GoRoute(
      path: '/home',
        pageBuilder: (context, state) => createPageRoute(context, state: state, child: const HomePage())

    ),
  ],
);
