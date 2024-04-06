import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mono/Core/Constants/colors.dart';
import 'package:mono/Presentation/Components/Cards/user_card.dart';

import '../../../Riverpod/home_provider_notifiers.dart';
import 'Widgets/home_view.dart';
import 'Widgets/statistic_view.dart';

class HomePage extends ConsumerWidget {
  HomePage({super.key});

  final PageController pageController = PageController(initialPage: 0);
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(homeStateProvider).fetchUserInfo();
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
          child: _tabBar()),
      body: Consumer(builder: (context, state, child) {
        final data = state.watch(homeStateProvider);
        return PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: [
            HomeView(data: data),
            const StatisticView(),
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

  Widget _tabBar() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(
        children: [
          buildTab(
            onPress: () {
              selectedIndex = 0;
              print(selectedIndex);

              pageController.jumpToPage(selectedIndex);
            },
            icon: Icons.home_filled,
            index: 0,
          ),
          sizedBoxW(30),
          buildTab(
            onPress: () {
              selectedIndex = 1;
              print(selectedIndex);

              pageController.jumpToPage(selectedIndex);
            },
            icon: Icons.bar_chart_rounded,
            index: 1,
          ),
        ],
      ),
      Row(
        children: [
          buildTab(
            onPress: () {
              selectedIndex = 2;
              print(selectedIndex);
              pageController.jumpToPage(selectedIndex);
            },
            icon: Icons.account_balance_wallet,
            index: 2,
          ),
          sizedBoxW(30),
          buildTab(
            onPress: () {
              selectedIndex = 3;
              print(selectedIndex);

              pageController.jumpToPage(selectedIndex);
            },
            icon: Icons.person,
            index: 3,
          ),
        ],
      )
    ]);
  }

  Widget buildTab({required IconData icon, required int index, required onPress}) {
    Color iconColor = index == selectedIndex ? AppColors.primaryColor : Colors.grey;
    return IconButton(
      onPressed: onPress,
      icon: Icon(
        icon,
        color: iconColor,
      ),
    );
  }
}
