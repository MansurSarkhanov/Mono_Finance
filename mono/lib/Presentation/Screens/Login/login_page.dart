import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mono/Core/Constants/colors.dart';
import 'package:mono/Presentation/Animations/bounce_animation.dart';
import 'package:mono/Presentation/Components/Buttons/login_button.dart';
import 'package:mono/Riverpod/auth_provider.dart';

import '../../Components/Inputs/custom_field.dart';
import '../../Components/auth_background.dart';

final checkValue = StateProvider<bool>((ref) {
  return false;
});

class LoginPage extends ConsumerWidget {
  LoginPage({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, ref) {
    final loginProvider = ref.watch(authProviderRef);

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          const AuthBackground(),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: BounceFromBottomAnimation(
                  delay: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const BounceFromBottomAnimation(
                        isTop: true,
                        delay: 4,
                        child: Column(
                          children: [
                            Text(
                              "Login",
                              style: TextStyle(fontSize: 32),
                            ),
                            Text("Please login to continue"),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      BounceFromBottomAnimation(
                        delay: 4,
                        child: Card(
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: const [BoxShadow(blurRadius: 100, color: AppColors.primaryColor)],
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
                              child: Column(
                                children: [
                                  BounceFromBottomAnimation(
                                    isBigOffset: true,
                                    delay: 4,
                                    isLeft: true,
                                    isVertical: false,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text('Email Address'),
                                        CustomField(
                                          controller: _emailController,
                                          hintText: "email@gmail.com",
                                        ),
                                      ],
                                    ),
                                  ),
                                  BounceFromBottomAnimation(
                                    isBigOffset: true,
                                    delay: 4,
                                    isLeft: false,
                                    isVertical: false,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text('Password'),
                                        CustomField(
                                          controller: _passwordController,
                                          hintText: "*******",
                                        ),
                                      ],
                                    ),
                                  ),
                                  BounceFromBottomAnimation(
                                    delay: 4,
                                    child: Row(
                                      children: [
                                        Consumer(builder: (context, state, child) {
                                          final isCheck = state.watch(checkValue);
                                          return Checkbox(
                                              activeColor: AppColors.primaryColor,
                                              value: isCheck,
                                              onChanged: (value) {
                                                state.read(checkValue.state).state = value ?? false;
                                              });
                                        }),
                                        const Text("Remember me"),
                                        const Spacer(),
                                        TextButton(onPressed: () {}, child: const Text("Forget Password"))
                                      ],
                                    ),
                                  ),
                                  BounceFromBottomAnimation(
                                      delay: 3,
                                      child: AuthButton(
                                        title: "Login",
                                        onPress: () {
                                          loginProvider.value?.loginUserWithEmail(
                                              email: _emailController.text, password: _passwordController.text);

                                          context.go('/home');
                                          FocusManager.instance.primaryFocus?.unfocus();
                                        },
                                      )),
                                  BounceFromBottomAnimation(
                                      delay: 4,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const Text("Don't have an account?"),
                                          TextButton(
                                              onPressed: () {
                                                context.go('/register');
                                              },
                                              child: const Text("Sign up"))
                                        ],
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
