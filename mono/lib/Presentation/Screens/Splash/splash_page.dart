import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mono/Core/Constants/Path/icon_path.dart';
import 'package:mono/Core/Constants/colors.dart';
import 'package:mono/Utility/Extensions/icon_path_extension.dart';

import '../../../Riverpod/auth_provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final SplashCheckProvider provider = SplashCheckProvider();
  @override
  void initState() {
    super.initState();
    provider.checkAuth();
  }

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
