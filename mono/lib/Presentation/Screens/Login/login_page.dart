import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mono/Core/Constants/colors.dart';
import 'package:mono/Utility/Extensions/image_path_extension.dart';

import '../../../Core/Constants/Path/image_path.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: SvgPicture.asset(
                  ImagePath.onboarding.toPathSvg(),
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: SvgPicture.asset(
                  ImagePath.onboarding.toPathSvg(),
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Login"),
                  const Text("Please login to continue"),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: AppColors.primaryColor),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 12),
                      child: Column(
                        children: [
                          TextField(),
                          TextField(),
                        ],
                      ),
                    ),
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
