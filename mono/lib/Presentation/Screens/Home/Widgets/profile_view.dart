import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mono/Core/Utility/Extensions/image_path_extension.dart';

import '../../../../Core/Constants/Path/image_path.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
                child: SvgPicture.asset(
              ImagePath.card.toPathSvg(),
              fit: BoxFit.fill,
            )),
            Expanded(
              flex: 2,
              child: Container(),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(left: 24.0, right: 24, top: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [],
          ),
        )
      ],
    );
  }
}
