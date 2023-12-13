import 'package:cinetopia/common/images.dart';
import 'package:cinetopia/screens/auth/splash_screen.dart';
import 'package:flutter/material.dart';

class LoginChoiceScreen extends StatefulWidget {
  const LoginChoiceScreen(
      {required this.goToLogin, required this.goToRegister, super.key});

  final void Function() goToLogin;
  final void Function() goToRegister;

  @override
  State<LoginChoiceScreen> createState() => _LoginChoiceScreenState();
}

class _LoginChoiceScreenState extends State<LoginChoiceScreen> {
  void goToLoginScreen() {
    widget.goToLogin();
  }

  void goToRegistratonScreen() {
    widget.goToRegister();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          const Spacer(),
          appLogo,
          const Text(
            "CINETOPIA",
            style: TextStyle(
                fontWeight: FontWeight.w400, fontSize: 40, letterSpacing: 5),
          ),
          const SizedBox(
            height: 5,
          ),
          const DotsWidget(),
          const Spacer(
            flex: 2,
          ),
          SizedBox(
            width: double.infinity,
            height: 45,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 50),
              child: ElevatedButton(
                onPressed: goToLoginScreen,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Connexion",
                  style: TextStyle(letterSpacing: 1),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: double.infinity,
            height: 45,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 50),
              child: ElevatedButton(
                onPressed: goToRegistratonScreen,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                  elevation: 0,
                  side: const BorderSide(color: Colors.black),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Inscription",
                  style: TextStyle(letterSpacing: 1),
                ),
              ),
            ),
          ),
          const Spacer(
            flex: 1,
          ),
        ],
      ),
    );
  }
}
