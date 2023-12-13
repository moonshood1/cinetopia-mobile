import 'package:cinetopia/common/colors.dart';
import 'package:cinetopia/screens/auth/widgets/auth_header_widget.dart';
import 'package:cinetopia/screens/auth/widgets/auth_methods.dart';
import 'package:cinetopia/screens/auth/widgets/auth_custom_input_widget.dart';
import 'package:cinetopia/screens/home/home_root_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen(
      {required this.goToRegister,
      required this.goToLoginChoice,
      required this.goToPassword,
      super.key});

  final void Function() goToRegister, goToLoginChoice, goToPassword;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    void moveToRegisterScreen() {
      widget.goToRegister();
    }

    // void moveToChoiceScreen() {
    //   widget.goToLoginChoice();
    // }

    void moveToPasswordScreen() {
      widget.goToPassword();
    }

    return SafeArea(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height / 20,
              horizontal: MediaQuery.of(context).size.width / 15,
            ),
            child: Column(
              children: <Widget>[
                const AuthHeaderWidget(
                  text: "Content de vous revoir parmi nous . ",
                ),
                const SizedBox(
                  height: 30,
                ),
                const CustomInputWidget(
                  textLabel: "Votre adresse email",
                  isPassword: false,
                ),
                const SizedBox(
                  height: 30,
                ),
                const CustomInputWidget(
                  textLabel: "Votre mot de passe",
                  isPassword: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: moveToPasswordScreen,
                  child: const Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      "Mot de passe oublié ?",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFFB1B1B1),
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeRootScreen(),
                      ),
                    ),
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
                const SizedBox(
                  height: 40,
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "ou continuer avec",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const AuthMethods(
                  isMethod: false,
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "Vous n’avez pas de compte ? ",
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                    TextButton(
                      onPressed: moveToRegisterScreen,
                      child: Text(
                        "Inscription",
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
