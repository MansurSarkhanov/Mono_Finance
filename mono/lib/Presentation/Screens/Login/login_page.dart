import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mono/Core/Constants/colors.dart';
import 'package:mono/Presentation/Animations/bounce_animation.dart';
import 'package:mono/Presentation/Animations/page_route.dart';
import 'package:mono/Presentation/Components/Buttons/login_button.dart';
import 'package:mono/Presentation/Screens/Home/home_page.dart';
import 'package:mono/Presentation/Screens/Register/register_page.dart';
import 'package:mono/Riverpod/auth_provider.dart';

import '../../Components/Inputs/custom_field.dart';
import '../../Components/auth_background.dart';

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
                                        Checkbox(
                                            activeColor: AppColors.primaryColor, value: true, onChanged: (value) {}),
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
                                          FocusManager.instance.primaryFocus?.unfocus();
                                          createPageRoute(context, const HomePage());
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
                                                createPageRoute(context, RegisterPage());
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
