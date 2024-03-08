import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mono/Core/Constants/Path/image_path.dart';
import 'package:mono/Utility/Extensions/image_path_extension.dart';

class AuthBackground extends StatelessWidget {
  const AuthBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
