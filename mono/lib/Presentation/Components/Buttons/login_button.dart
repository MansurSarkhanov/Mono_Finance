import 'package:flutter/material.dart';
import 'package:mono/Presentation/Components/Buttons/primary_button.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 20, bottom: 20),
      child: PrimaryButton(
          child: Center(
        child: Text(
          "Login",
          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      )),
    );
  }
}
