import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mono/Core/Utility/Extensions/icon_path_extension.dart';
import 'package:mono/Core/Utility/Extensions/image_path_extension.dart';

import '../../../../Core/Constants/Path/icon_path.dart';
import '../../../../Core/Constants/Path/image_path.dart';
import '../../../../Riverpod/home_provider_notifiers.dart';
import '../../../Components/Cards/user_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
    required this.data,
  });

  final HomeStateNotifier data;

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Good afternoon,'),
                      Text(
                        data.userModel.username ?? 'Test',
                        style: const TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                  Container(
                    decoration:
                        BoxDecoration(color: Colors.white.withOpacity(0.04), borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(IconPath.notification.toPathSvg()),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              UserCard(
                userModel: data.userModel,
              )
            ],
          ),
        )
      ],
    );
  }
}
