import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mono/Core/Constants/colors.dart';
import 'package:mono/Presentation/Components/Cards/user_card.dart';

import '../../../Riverpod/home_provider_notifiers.dart';
import 'Widgets/home_view.dart';
import 'Widgets/statistic_view.dart';

class HomePage extends ConsumerWidget {
  HomePage({super.key});

  final PageController pageController = PageController();
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
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.home_filled,
                ),
              ),
              sizedBoxW(20),
              IconButton(
                onPressed: () {},
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
                onPressed: () {},
                icon: const Icon(
                  Icons.account_balance_wallet,
                ),
              ),
              sizedBoxW(20),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.person,
                ),
              ),
            ],
          )
        ]),
      ),
      body: Consumer(builder: (context, state, child) {
        final data = state.watch(homeStateProvider);
        return PageView(
          controller: pageController,
          children: [
            const StatisticView(),
            HomeView(data: data),
            
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
