import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mono/Core/Constants/Path/icon_path.dart';
import 'package:mono/Core/Constants/colors.dart';
import 'package:mono/Core/Utility/Extensions/icon_path_extension.dart';
import 'package:mono/Presentation/Components/Cards/user_card.dart';

class StatisticView extends StatelessWidget {
  const StatisticView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 24, top: 60),
      child: Column(
        children: [
          Row(
            children: [
              const Spacer(),
              const Text(
                "Statistics",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              const Spacer(),
              SvgPicture.asset(IconPath.download.toPathSvg())
            ],
          ),
          sizedBoxH(40),
          Row(
            children: [
              Container(
                decoration: const BoxDecoration(color: AppColors.primaryColor),
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Day"),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
