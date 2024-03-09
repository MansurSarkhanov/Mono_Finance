import 'package:flutter/material.dart';
import 'package:mono/Core/Constants/colors.dart';

import 'Tabs/home_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: InkWell(
          child: Container(
            decoration: const BoxDecoration(color: AppColors.primaryColor, shape: BoxShape.circle),
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
        bottomNavigationBar: CustomBottomAppBar(
          tabController: tabController,
        ),
        body: TabBarView(controller: tabController, children: [
          const HomeTab(),
          Container(),
          Container(),
          Container(),
        ]));
  }
}

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      shadowColor: AppColors.primaryColor,
      notchMargin: 12,
      shape: const CircularNotchedRectangle(),
      child: TabBar(
          labelColor: AppColors.primaryColor,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.transparent,
          dividerColor: Colors.transparent,
          controller: tabController,
          tabs: const [
            Tab(
              icon: Icon(
                Icons.home_filled,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 30.0),
              child: Tab(
                icon: Icon(
                  Icons.bar_chart_rounded,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.0),
              child: Tab(
                icon: Icon(
                  Icons.account_balance_wallet,
                ),
              ),
            ),
            Tab(
              icon: Icon(
                Icons.person,
              ),
            ),
          ]),
    );
  }
}
