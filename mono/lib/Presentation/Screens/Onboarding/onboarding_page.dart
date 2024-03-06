import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mono/Core/Constants/Path/image_path.dart';
import 'package:mono/Core/Constants/size.dart';
import 'package:mono/Utility/Extensions/image_path_extension.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: mediaQuery(context),
            child: SvgPicture.asset(
              ImagePath.onboarding.toPathSvg(),
            ),
          ),
        ],
      ),
    );
  }
}
