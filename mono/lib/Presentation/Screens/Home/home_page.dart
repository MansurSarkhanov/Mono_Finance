import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mono/Core/Constants/colors.dart';
import 'package:mono/Core/Utility/Extensions/icon_path_extension.dart';
import 'package:mono/Core/Utility/Extensions/image_path_extension.dart';
import 'package:mono/Presentation/Components/Cards/user_card.dart';

import '../../../Core/Constants/Path/icon_path.dart';
import '../../../Core/Constants/Path/image_path.dart';
import '../../../Riverpod/home_provider_notifiers.dart';

class HomePage extends ConsumerWidget {
  HomePage({super.key});
  int currentIndex = 0;
  void changePage(int index) {
    if (currentIndex == index) {
      return;
    }
    currentIndex = index;
    print(currentIndex);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: InkWell(
        child: Container(
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(color: AppColors.primaryColor, blurRadius: 15),
          ], color: AppColors.primaryColor, shape: BoxShape.circle),
          child: const Padding(
            padding: EdgeInsets.all(20.0),
            child: Icon(
              Icons.add,
              size: 36,
              color: Colors.white,
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shadowColor: AppColors.primaryColor,
        notchMargin: 12,
        shape: const CircularNotchedRectangle(),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  changePage(0);
                },
                icon: const Icon(
                  Icons.home_filled,
                ),
              ),
              sizedBoxW(20),
              IconButton(
                onPressed: () {
                  changePage(1);
                },
                icon: const Icon(
                  Icons.bar_chart_rounded,
                ),
              ),
            ],
          ),
          sizedBoxW(50),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  changePage(2);
                },
                icon: const Icon(
                  Icons.account_balance_wallet,
                ),
              ),
              sizedBoxW(20),
              IconButton(
                onPressed: () {
                  changePage(3);
                },
                icon: const Icon(
                  Icons.person,
                ),
              ),
            ],
          )
        ]),
      ),
      body: Consumer(builder: (context, ref, child) {
        ref.read(homeStateProvider.notifier).fetchUserInfo();
        final userModel = ref.watch(homeStateProvider.notifier).state;
        return IndexedStack(
          index: currentIndex,
          children: [
            Stack(
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
                                userModel.username ?? 'Test',
                                style: const TextStyle(fontSize: 20),
                              )
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.04), borderRadius: BorderRadius.circular(8)),
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
                        userModel: userModel,
                      )
                    ],
                  ),
                )
              ],
            ),
            Container(
              color: Colors.red,
              height: 200,
              width: 200,
            ),
            Container(
              color: Colors.green,
              height: 200,
              width: 200,
            ),
            Container(
              color: Colors.blue,
              height: 200,
              width: 200,
            ),
          ],
        );
      }),
    );
  }
}
