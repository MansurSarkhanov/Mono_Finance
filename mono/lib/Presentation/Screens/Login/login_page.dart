import 'package:flutter/material.dart';
import 'package:mono/Core/Constants/colors.dart';
import 'package:mono/Presentation/Animations/bounce_animation.dart';
import 'package:mono/Presentation/Components/Buttons/login_button.dart';

import '../../Components/Inputs/custom_field.dart';
import '../../Components/auth_background.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const AuthBackground(),

          Padding(
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
                                const BounceFromBottomAnimation(
                                  isBigOffset: true,
                                  delay: 4,
                                  isLeft: true,
                                  isVertical: false,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Email Address'),
                                      CustomField(
                                        hintText: "email@gmail.com",
                                      ),
                                    ],
                                  ),
                                ),
                                const BounceFromBottomAnimation(
                                  isBigOffset: true,
                                  delay: 4,
                                  isLeft: false,
                                  isVertical: false,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Password'),
                                      CustomField(
                                        hintText: "*******",
                                      ),
                                    ],
                                  ),
                                ),
                                BounceFromBottomAnimation(
                                  delay: 4,
                                  child: Row(
                                    children: [
                                      Checkbox(activeColor: AppColors.primaryColor, value: true, onChanged: (value) {}),
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
                                      onPress: () {},
                                    )),
                                BounceFromBottomAnimation(
                                    delay: 4,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Text("Don't have an account?"),
                                        TextButton(onPressed: () {}, child: const Text("Sign up"))
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
          )
        ],
      ),
    );
  }
}
