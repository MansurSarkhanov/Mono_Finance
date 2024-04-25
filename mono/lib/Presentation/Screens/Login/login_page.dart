import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mono/Core/Constants/colors.dart';
import 'package:mono/Presentation/Animations/bounce_animation.dart';
import 'package:mono/Presentation/Components/Buttons/auth_button.dart';
import 'package:mono/Riverpod/auth_provider_notifiers.dart';

import '../../Components/Inputs/custom_field.dart';
import '../../Components/auth_background.dart';

final checkValue = StateProvider<bool>((ref) {
  return false;
});

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                              style: TextStyle(fontSize: 32, color: Colors.black),
                            ),
                            Text(
                              "Please login to continue",
                              style: TextStyle(color: Colors.grey),
                            ),
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
                                        const Text(
                                          'Email Address',
                                          style: TextStyle(color: Colors.black),
                                        ),
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
                                        const Text(
                                          'Password',
                                          style: TextStyle(color: Colors.black),
                                        ),
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
                                                state.read(checkValue.notifier).state = value ?? false;
                                              });
                                        }),
                                        const Text(
                                          "Remember me",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        const Spacer(),
                                        TextButton(onPressed: () {}, child: const Text("Forget Password"))
                                      ],
                                    ),
                                  ),
                                  BounceFromBottomAnimation(
                                      delay: 3,
                                      child: AuthButton(
                                        title: "Login",
                                        onPress: () async {
                                          final result = await loginProvider.value?.loginUserWithEmail(
                                              email: _emailController.text, password: _passwordController.text);
                                          if (result != null) {
                                            if (result.isSuccess()) {
                                              if (context.mounted) {
                                                context.go('/home');
                                              }
                                            } else if (result.isError()) {
                                              final errorResult = result.tryGetError();
                                              if (context.mounted) {
                                                Flushbar(
                                                backgroundColor: AppColors.primaryColor,
                                                margin: const EdgeInsets.all(24),
                                                borderRadius: BorderRadius.circular(20),
                                                duration: const Duration(seconds: 2),
                                                flushbarPosition: FlushbarPosition.TOP,
                                                title: "Auth Error",
                                                message: errorResult!.message,
                                              ).show(context);
                                              }
                                             
                                            }
                                          }

                                          FocusManager.instance.primaryFocus?.unfocus();
                                        },
                                      )),
                                  BounceFromBottomAnimation(
                                      delay: 4,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            "Don't have an account?",
                                            style: TextStyle(color: Colors.black),
                                          ),
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
