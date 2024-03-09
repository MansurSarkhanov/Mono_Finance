import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mono/Core/Constants/Path/icon_path.dart';
import 'package:mono/Core/Constants/colors.dart';
import 'package:mono/Presentation/Screens/Home/home_page.dart';
import 'package:mono/Presentation/Screens/Onboarding/onboarding_page.dart';
import 'package:mono/Riverpod/auth_provider.dart';
import 'package:mono/Utility/Extensions/icon_path_extension.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: FutureBuilder(
          future: ref.read(checkProvider.notifier).checkAuth(),
          builder: (context, snapshot) {
            print(snapshot.data);
            if (snapshot.hasData) {
              if (snapshot.data == true) {
                return const HomePage();
              }
              else if (snapshot.data == false) {
                return const OnboardingPage();

              }
            }
            return Center(
              child: SvgPicture.asset(IconPath.mono.toPathSvg()),
            );
          }),
    );
  }
}
