import 'package:cinetopia/common/colors.dart';
import 'package:cinetopia/screens/auth/widgets/auth_methods.dart';
import 'package:flutter/material.dart';
import 'package:cinetopia/screens/auth/widgets/auth_header_widget.dart';

class AuthMethodsScreen extends StatefulWidget {
  const AuthMethodsScreen(
      {required this.goToLoginScreen, required this.goToRegister, super.key});

  final void Function() goToLoginScreen, goToRegister;

  @override
  State<AuthMethodsScreen> createState() => _AuthMethodsScreenState();
}

class _AuthMethodsScreenState extends State<AuthMethodsScreen> {
  @override
  Widget build(BuildContext context) {
    double pageHeight = MediaQuery.of(context).size.height;
    double pageWidth = MediaQuery.of(context).size.width;

    void moveToLogin() {
      widget.goToLoginScreen();
    }

    void moveToRegistration() {
      widget.goToRegister();
    }

    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: pageHeight / 15, horizontal: pageWidth / 15),
            child: Column(
              children: <Widget>[
                const AuthHeaderWidget(
                  text:
                      "Inscrivez vous sur CINETOPIA en liant un de vos comptes",
                ),
                const SizedBox(
                  height: 30,
                ),
                const AuthMethods(isMethod: true),
                const SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.center,
                  child: TextButton.icon(
                    icon: Icon(Icons.arrow_back, color: greenbg),
                    onPressed: moveToRegistration,
                    label: Text(
                      "Méthode d'inscription basique",
                      style: TextStyle(color: greenbg),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 150,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "Vous avez déjà de compte ? ",
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                    TextButton(
                      onPressed: moveToLogin,
                      child: Text(
                        "Connexion",
                        style: TextStyle(color: greenbg),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
