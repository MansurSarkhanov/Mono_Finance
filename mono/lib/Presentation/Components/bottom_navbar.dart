import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mono/Riverpod/home_provider_notifiers.dart';

import '../../Core/Constants/colors.dart';
import 'Cards/user_card.dart';

class BottomNavBar extends ConsumerStatefulWidget {
  const BottomNavBar({super.key, required this.controller});
  final PageController controller;

  @override
  ConsumerState<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends ConsumerState<BottomNavBar> {

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        color: Colors.white,
        shadowColor: AppColors.primaryColor,
        notchMargin: ref.watch(homeStateProvider).selectedIndex == 0 ? 12 : 0,
        shape: const CircularNotchedRectangle(),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              buildTab(
                onPress: () {
                  ref.watch(homeStateProvider).selectedIndex = 0;
                  setState(() {});
                  widget.controller.jumpToPage(ref.watch(homeStateProvider).selectedIndex);
                },
                icon: Icons.home_filled,
                index: 0,
              ),
              sizedBoxW(30),
              buildTab(
                onPress: () {
                  ref.watch(homeStateProvider).selectedIndex = 1;
                  setState(() {});
                  widget.controller.jumpToPage(ref.watch(homeStateProvider).selectedIndex);
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
                  ref.watch(homeStateProvider).selectedIndex = 2;
                  setState(() {});
                  widget.controller.jumpToPage(ref.watch(homeStateProvider).selectedIndex);
                },
                icon: Icons.account_balance_wallet,
                index: 2,
              ),
              sizedBoxW(30),
              buildTab(
                onPress: () {
                  ref.watch(homeStateProvider).selectedIndex = 3;
                  setState(() {});
                  widget.controller.jumpToPage(ref.watch(homeStateProvider).selectedIndex);
                },
                icon: Icons.person,
                index: 3,
              ),
            ],
          )
        ]));
  }

  Widget buildTab({required IconData icon, required int index, required onPress}) {
    Color iconColor = index == ref.watch(homeStateProvider).selectedIndex ? AppColors.primaryColor : Colors.grey;
    return IconButton(
      onPressed: onPress,
      icon: Icon(
        icon,
        color: iconColor,
      ),
    );
  }
}
