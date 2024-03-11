import 'package:flutter/material.dart';
import 'package:mono/Presentation/Components/Buttons/primary_button.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({super.key, required this.title, required this.onPress});
  final String title;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: PrimaryButton(
        onPress: onPress,
          child: Center(
        child: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        ),
      ),
    );
  }
}
