import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mono/Core/Constants/Path/icon_path.dart';
import 'package:mono/Core/Utility/Extensions/icon_path_extension.dart';
import 'package:mono/Presentation/Screens/Home/Widgets/home_view.dart';

import '../../../Riverpod/home_provider_notifiers.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
    required this.data,
  });
  final HomeStateNotifier data;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: const [BoxShadow(color: Color.fromARGB(255, 28, 90, 86), blurRadius: 100)],
          color: const Color(
            0xFF2F7E79,
          ),
          borderRadius: BorderRadius.circular(24)),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Total Balance"),
                    sizedBoxH(8),
                    data.isUserLoading
                        ? const CustomProgressIndicator(
                            color: Colors.white,
                          )
                        : Text(
                            "\$ ${data.userModel.money}",
                      style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_horiz_outlined,
                      color: Colors.white,
                    ))
              ],
            ),
            sizedBoxH(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withOpacity(0.04)),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: SvgPicture.asset(IconPath.arrowdown.toPathSvg()),
                          ),
                        ),
                        sizedBoxW(6),
                        const Text(
                          "Income",
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                    sizedBoxH(8),
                    data.isUserLoading
                        ? const CustomProgressIndicator(
                            color: Colors.white,
                          )
                        : Text(
                            " \$ ${data.userModel.income?.toDouble()}",
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withOpacity(0.04)),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: SvgPicture.asset(IconPath.arrowup.toPathSvg()),
                          ),
                        ),
                        sizedBoxW(6),
                        const Text(
                          "Expenses",
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                    sizedBoxH(8),
                    data.isUserLoading
                        ? const CustomProgressIndicator(
                            color: Colors.white,
                          )
                        : Text(
                            " \$ ${data.userModel.expenses?.toDouble()}",
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

SizedBox sizedBoxH(double height) {
  return SizedBox(
    height: height,
  );
}

SizedBox sizedBoxW(double width) {
  return SizedBox(
    width: width,
  );
}
