import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mono/Core/Constants/colors.dart';
import 'package:mono/Presentation/Animations/bounce_animation.dart';
import 'package:mono/Presentation/Components/Buttons/login_button.dart';
import 'package:mono/Riverpod/auth_provider_notifiers.dart';

import '../../Components/Inputs/custom_field.dart';
import '../../Components/auth_background.dart';

class RegisterPage extends ConsumerWidget {
  RegisterPage({super.key});
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, ref) {
    final authProvider = ref.watch(authProviderRef);
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
                              "Register",
                              style: TextStyle(fontSize: 32, color: Colors.black),
                            ),
                            Text(
                              "Please register to continue",
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
                                    isLeft: false,
                                    isVertical: false,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text('Username'),
                                        CustomField(
                                          controller: _usernameController,
                                          hintText: "Jhon Harry",
                                        ),
                                      ],
                                    ),
                                  ),
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
                                        Checkbox(
                                            activeColor: AppColors.primaryColor, value: true, onChanged: (value) {}),
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
                                        title: "Register",
                                        onPress: () {
                                          authProvider.when(
                                            data: (data) async {
                                              await data.createUserWithEmail(
                                                  email: _emailController.text,
                                                  password: _passwordController.text,
                                                  username: _usernameController.text);
                                              context.go('/home');
                                            },
                                            error: (error, stackTrace) => Text(error.toString()),
                                            loading: () => const CircularProgressIndicator(),
                                          );
                                        },
                                      )),
                                  BounceFromBottomAnimation(
                                      delay: 4,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            "Do you have an account?",
                                            style: TextStyle(color: Colors.black),
                                          ),
                                          TextButton(
                                              onPressed: () async {
                                                context.go('/login');
                                                FocusManager.instance.primaryFocus?.unfocus();
                                              },
                                              child: const Text("Sign In"))
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
