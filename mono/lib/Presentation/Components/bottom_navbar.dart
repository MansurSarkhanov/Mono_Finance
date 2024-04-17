import 'package:flutter/material.dart';

import '../../Core/Constants/colors.dart';
import 'Cards/user_card.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key, required this.controller});
  final PageController controller;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        color: Colors.white,
        shadowColor: AppColors.primaryColor,
        notchMargin: 12,
        shape: const CircularNotchedRectangle(),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              buildTab(
                onPress: () {
                  selectedIndex = 0;
                  setState(() {});
                  widget.controller.jumpToPage(selectedIndex);
                },
                icon: Icons.home_filled,
                index: 0,
              ),
              sizedBoxW(30),
              buildTab(
                onPress: () {
                  selectedIndex = 1;
                  setState(() {});
                  widget.controller.jumpToPage(selectedIndex);
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
                  setState(() {});
                  widget.controller.jumpToPage(selectedIndex);
                },
                icon: Icons.account_balance_wallet,
                index: 2,
              ),
              sizedBoxW(30),
              buildTab(
                onPress: () {
                  selectedIndex = 3;
                  setState(() {});
                  widget.controller.jumpToPage(selectedIndex);
                },
                icon: Icons.person,
                index: 3,
              ),
            ],
          )
        ]));
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
