import 'package:flutter/material.dart';

import '/widgets/my_button.dart';
import '../widgets/custom_text_field.dart';

class SignInScreen extends StatefulWidget {
  static const String screenRoute = 'sign_in_screen';

  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 180,
              child: Image.asset("assets/logo.png"),
            ),
            const SizedBox(height: 50),
            CustomTextField(
              title: "Enter your email",
            ),
            const SizedBox(height: 10),
            CustomTextField(
              title: "Enter your password",
            ),
            const SizedBox(height: 10),
            MyButton(
              color: Colors.yellow[900]!,
              title: 'register',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

