import 'package:flutter/material.dart';
import 'package:mono/Core/Constants/colors.dart';

import '../../../Core/Constants/strings.dart';

class StartedButton extends StatelessWidget {
  const StartedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, left: 24, right: 24),
      child: InkWell(
        child: Container(
            decoration: const BoxDecoration(
                boxShadow: [BoxShadow(blurRadius: 14, offset: Offset(1, 8), color: AppColors.primaryColor)],
                borderRadius: BorderRadius.all(Radius.circular(40)),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF69AEA9), AppColors.primaryColor]),
                color: AppColors.primaryColor),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Center(
                  child: Text(
                AppStrings.startButton,
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
              )),
            )),
      ),
    );
  }
}
