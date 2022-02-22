import 'package:flutter/material.dart';
import '/widgets/my_button.dart';

import '../widgets/custom_text_field.dart';

class RegistrationScreen extends StatefulWidget {
  static const String screenRoute = 'registration_screen';

  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              color: Colors.blue[800]!,
              title: 'register',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

