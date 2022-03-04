import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:messageme_app/screens/chat_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '/widgets/my_button.dart';
import '../widgets/custom_text_field.dart';

class SignInScreen extends StatefulWidget {
  static const String screenRoute = 'sign_in_screen';

  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _auth = FirebaseAuth.instance;

  late String email;
  late String password;

  bool showSpinner = false;

  void _submit() {
    setState(() {
      showSpinner = true;
      Future.delayed(const Duration(seconds: 4), () {
        setState(() {
          showSpinner = false;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Padding(
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
                  onChanged: (value) {
                    email = value;
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  title: "Enter your password",
                  onChanged: (value) {
                    password = value;
                  },
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                ),
                const SizedBox(height: 10),
                MyButton(
                  color: Colors.yellow[900]!,
                  title: 'sign in',
                  onPressed: () async {
                    // setState(() {
                    //   showSpinner = true;
                    // });
                    _submit();
                    try {
                      final user = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);
                      if (user != null) {
                        Navigator.pushNamed(context, ChatScreen.screenRoute);
                      }
                      // setState(() {
                      //   showSpinner = false;
                      // });
                    } catch (e) {
                      print(e);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
