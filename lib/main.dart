import 'package:flutter/material.dart';
import 'package:messageme_app/screens/registration_screen.dart';
import 'package:messageme_app/screens/sign_in_screen.dart';
import 'package:messageme_app/screens/welcome_screen.dart';
import '/screens/chat_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MessageMe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: WelcomeScreen.screenRoute,
      routes: {
        WelcomeScreen.screenRoute : (context) => const WelcomeScreen(),
        SignInScreen.screenRoute :(context) => const SignInScreen(),
        RegistrationScreen.screenRoute :(context) => const RegistrationScreen(),
        ChatScreen.screenRoute :(context) => const ChatScreen(),
      },
    );
  }
}
