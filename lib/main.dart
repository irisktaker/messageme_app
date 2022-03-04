import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '/screens/registration_screen.dart';
import '/screens/sign_in_screen.dart';
import '/screens/welcome_screen.dart';
import '/screens/chat_screen.dart';

// to use the firebase
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // to use the firebase | type Future<FirebaseApp>
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MessageMe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: _auth.currentUser != null ? ChatScreen.screenRoute : WelcomeScreen.screenRoute,
      routes: {
        WelcomeScreen.screenRoute: (context) => const WelcomeScreen(),
        SignInScreen.screenRoute: (context) => const SignInScreen(),
        RegistrationScreen.screenRoute: (context) => const RegistrationScreen(),
        ChatScreen.screenRoute: (context) => const ChatScreen(),
      },
    );
  }
}
