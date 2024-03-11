import 'package:flutter/material.dart';
import 'package:mono/Core/Constants/colors.dart';
import 'package:mono/Presentation/Components/Cards/user_card.dart';

import 'Tabs/home_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int currentIndex = 0;
  void changePage(int index) {
    if (currentIndex == index) {
      return;
    }
    currentIndex = index;
    setState(() {});
    print(currentIndex);
  }

  @override
  Widget build(BuildContext context) {
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
      body: IndexedStack(
        index: currentIndex,
        children: [
          const HomeTab(),
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
      ),
    );
  }
}
