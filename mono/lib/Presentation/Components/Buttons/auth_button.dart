import 'package:flutter/material.dart';
import 'package:mono/Presentation/Components/Buttons/primary_button.dart';
import 'package:riverpod/riverpod.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({super.key, required this.title, required this.onPress, required this.authProvider});
  final String title;
  final VoidCallback onPress;
  final AsyncValue authProvider;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: PrimaryButton(
        onPress: onPress,
        child: Center(
            child: authProvider.when(
          data: (_) => Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          loading: () => const CircularProgressIndicator(),
          error: (error, stackTrace) => Text(
            'Error: $error',
            style: const TextStyle(fontSize: 20.0),
          ),
        )
         
        ),
      ),
    );
  }
}
