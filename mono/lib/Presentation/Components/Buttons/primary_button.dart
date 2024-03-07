import 'package:flutter/material.dart';

import '../../../Core/Constants/colors.dart';

class PrimaryButton extends StatefulWidget {
  const PrimaryButton({super.key, required this.child});
  final Widget child;

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: const BoxDecoration(
            boxShadow: [BoxShadow(blurRadius: 14, offset: Offset(1, 8), color: AppColors.primaryColor)],
            borderRadius: BorderRadius.all(Radius.circular(40)),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF69AEA9), AppColors.primaryColor]),
            color: AppColors.primaryColor),
        child: Padding(padding: const EdgeInsets.symmetric(vertical: 16.0), child: widget.child),
      ),
    );
  }
}
