import 'package:flutter/material.dart';
import 'package:messageme_app/screens/chat_screen.dart';
import '/widgets/my_button.dart';
import '../widgets/custom_text_field.dart';

// to add a new user | authentication
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationScreen extends StatefulWidget {
  static const String screenRoute = 'registration_screen';

  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  // to add a new user | authentication instance
  final _auth = FirebaseAuth.instance;

  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
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
                onChanged: (value) {
                  // save the user input value
                  email = value;
                },
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 10),
              CustomTextField(
                title: "Enter your password",
                // basic firebase required at least 6 characters for password
                onChanged: (value) {
                  // save the user input value
                  password = value;
                },
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
              ),
              const SizedBox(height: 10),
              MyButton(
                color: Colors.blue[800]!,
                title: 'register',
                onPressed: () async {
                  // test the input values
                  print(email);
                  print(password);

                  // now we can use these input data as we need
                  // add these values and save it for the user
                  // to use methods from FirebaseAuth.instance
                  // i'll add it to a variable of type final
                  // to be sure the this process is done we will use async with await
                  // note: sync means to keep running the app , async it will wait until finishing

                  // the process will not work alway right so we need to be sure of many conditions as if the email wrong or password or the user is register before ...
                  // we will use try catch

                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                      email: email,
                      password: password,
                    );
                    Navigator.pushNamed(context, ChatScreen.screenRoute);
                    // the newUser will be saved it the _auth object as a user signed in 
                  } catch (e) {
                    print(e);
                  }

                  // --
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
