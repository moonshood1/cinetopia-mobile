import 'package:flutter/material.dart';
import 'package:cinetopia/screens/auth/widgets/auth_header_widget.dart';
import 'package:cinetopia/screens/auth/widgets/auth_custom_input_widget.dart';
import 'package:cinetopia/common/colors.dart';

class PasswordForgotScreen extends StatefulWidget {
  const PasswordForgotScreen(
      {required this.goToOtpScreen, required this.goToLoginScreen, super.key});

  final void Function() goToLoginScreen, goToOtpScreen;

  @override
  State<PasswordForgotScreen> createState() => _PasswordForgotScreenState();
}

class _PasswordForgotScreenState extends State<PasswordForgotScreen> {
  @override
  Widget build(BuildContext context) {
    void moveToLoginScreen() {
      widget.goToLoginScreen();
    }

    void moveToOtp() {
      widget.goToOtpScreen();
    }

    double pageHeight = MediaQuery.of(context).size.height;
    double pageWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: pageHeight / 15, horizontal: pageWidth / 15),
            child: Column(
              children: <Widget>[
                const AuthHeaderWidget(
                  text:
                      "Entrez votre adresse email pour récupérer votre compte",
                ),
                const SizedBox(
                  height: 30,
                ),
                const CustomInputWidget(
                  textLabel: "Votre adresse email",
                  isPassword: false,
                ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: moveToOtp,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Envoyer le code de vérification ",
                      style: TextStyle(letterSpacing: 1),
                    ),
                  ),
                ),
                const SizedBox(height: 300),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "Vous avez votre mot de passe ?",
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                    TextButton(
                      onPressed: moveToLoginScreen,
                      child: Text(
                        "Connexion",
                        style: TextStyle(color: greenbg),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
