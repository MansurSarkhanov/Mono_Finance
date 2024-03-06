import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mono/Core/Constants/Path/image_path.dart';
import 'package:mono/Core/Constants/colors.dart';
import 'package:mono/Core/Constants/strings.dart';
import 'package:mono/Presentation/Animations/bounce_animation.dart';
import 'package:mono/Utility/Extensions/image_path_extension.dart';

import '../../Components/Buttons/started_button.dart';

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
          SvgPicture.asset(
            ImagePath.onboarding.toPathSvg(),
          ),
          Center(
            child: BounceFromBottomAnimation(
              delay: 3,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Stack(
                    children: [
                      Image.asset(ImagePath.men.toPathPng()),
                      Positioned(
                        right: 20,
                        child: BounceFromBottomAnimation(
                          isLeft: false,
                          isVertical: false,
                          delay: 3,
                          child: Image.asset(
                            ImagePath.donat.toPathPng(),
                            height: 80,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 20,
                        child: BounceFromBottomAnimation(
                          isLeft: true,
                          delay: 3,
                          isVertical: false,
                          child: Image.asset(
                            ImagePath.coint.toPathPng(),
                            height: 80,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 60.0, left: 60),
                    child: Text(
                      AppStrings.spendSave,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: AppColors.primaryColor, fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const StartedButton(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(AppStrings.already),
                      TextButton(
                        child: const Text(
                          AppStrings.login,
                          style: TextStyle(color: AppColors.primaryColor),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
