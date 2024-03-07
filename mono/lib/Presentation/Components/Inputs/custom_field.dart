import 'package:flutter/material.dart';
import 'package:mono/Core/Constants/colors.dart';

class CustomField extends StatelessWidget {
  const CustomField({
    super.key,
    required this.hintText,
  });
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8),
      child: Container(
          decoration:
              BoxDecoration(color: const Color.fromARGB(255, 245, 245, 245), borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0, bottom: 4),
            child: TextField(
              cursorColor: AppColors.primaryColor,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14)),
            ),
          )),
    );
  }
}
