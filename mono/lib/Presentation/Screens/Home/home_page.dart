import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mono/Core/Constants/colors.dart';

import '../../../Riverpod/home_provider_notifiers.dart';
import '../../Components/bottom_navbar.dart';
import 'Widgets/home_view.dart';
import 'Widgets/profile_view.dart';
import 'Widgets/statistic_view.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    ref.read(homeStateProvider).fetchUserInfo();
    ref.read(homeStateProvider).getUserFinance();

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ref.watch(homeStateProvider).selectedIndex == 0
          ? InkWell(
        child: Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryColor,
                blurRadius: 15,
              ),
            ],
            color: AppColors.primaryColor,
            shape: BoxShape.circle,
          ),
          child: const Padding(
            padding: EdgeInsets.all(20.0),
            child: Icon(
              Icons.add,
              size: 36,
              color: Colors.white,
            ),
          ),
        ),
            )
          : const SizedBox.shrink(),
      bottomNavigationBar: BottomNavBar(
        controller: pageController,
      ),
      body: Consumer(builder: (context, state, child) {
        final data = state.watch(homeStateProvider);
        return PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: [
            HomeView(
              data: data,
            ),
            const StatisticView(),
            Container(
              color: Colors.green,
              height: 200,
              width: 200,
            ),
            const ProfileView()
          ],
        );
      }),
    );
  }
}
