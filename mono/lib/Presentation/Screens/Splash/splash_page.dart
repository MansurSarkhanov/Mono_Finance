import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mono/Core/Constants/Path/icon_path.dart';
import 'package:mono/Core/Constants/colors.dart';
import 'package:mono/Utility/Extensions/icon_path_extension.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: SvgPicture.asset(IconPath.mono.toPathSvg()),
      ),
    );
  }
}
