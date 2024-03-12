import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mono/Core/Constants/Path/icon_path.dart';
import 'package:mono/Core/Constants/colors.dart';
import 'package:mono/Core/Utility/Extensions/icon_path_extension.dart';
import 'package:mono/Presentation/Components/Cards/user_card.dart';
import 'package:mono/Presentation/Screens/Home/Widgets/line_chart.dart';
import 'package:mono/Riverpod/home_provider_notifiers.dart';

class StatisticView extends StatelessWidget {
  const StatisticView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
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
                children: ref
                    .watch(homeStateProvider.notifier)
                    .items
                    .map((e) => Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 4),
                            decoration:
                                BoxDecoration(color: AppColors.primaryColor, borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12.0),
                              child: Center(
                                child: Text(e),
                              ),
                            ),
                          ),
                        ))
                    .toList()),
            sizedBoxH(40),
            const LineChartSample2()
          ],
        ),
      );
    }
    );
  }
}
