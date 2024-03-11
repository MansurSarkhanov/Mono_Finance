import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mono/Core/Constants/Path/icon_path.dart';
import 'package:mono/Core/Constants/Path/image_path.dart';
import 'package:mono/Core/Utility/Extensions/icon_path_extension.dart';
import 'package:mono/Core/Utility/Extensions/image_path_extension.dart';

import '../../../Components/Cards/user_card.dart';


class HomeTab extends StatelessWidget {
  const HomeTab({
    super.key,
  });

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
        Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24, top: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _header(),
              const SizedBox(
                height: 30,
              ),
              const UserCard()
            ],
          ),
        )
      ],
    );
  }

  Row _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Good afternoon,'),
            Text(
              'Mansur Sarkhanov',
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
        Container(
          decoration:
              BoxDecoration(color: Colors.transparent.withOpacity(0.04), borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(IconPath.notification.toPathSvg()),
          ),
        )
      ],
    );
  }
}
