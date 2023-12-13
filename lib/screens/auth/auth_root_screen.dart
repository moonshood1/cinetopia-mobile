import 'package:cinetopia/screens/auth/auth_methods_screen.dart';
import 'package:cinetopia/screens/auth/login_choice_screen.dart';
import 'package:cinetopia/screens/auth/login_screen.dart';
import 'package:cinetopia/screens/auth/otp_code_screen.dart';
import 'package:cinetopia/screens/auth/password_forgot.dart';
import 'package:cinetopia/screens/auth/register_screen.dart';
import 'package:cinetopia/screens/auth/splash_screen.dart';
import 'package:cinetopia/screens/auth/widgets/auth_app_bar.dart';
import 'package:flutter/material.dart';

class AuthRootScreen extends StatefulWidget {
  const AuthRootScreen({super.key});

  @override
  State<AuthRootScreen> createState() => _AuthRootScreenState();
}

class _AuthRootScreenState extends State<AuthRootScreen> {
  var activeScreen = "splash-screen";

  void goToLoginScreen() {
    setState(() {
      activeScreen = "login-screen";
    });
  }

  void goToRegisterScreen() {
    setState(() {
      activeScreen = "register-screen";
    });
  }

  void goToLoginChoiceScreen() {
    setState(() {
      activeScreen = "login-choice-screen";
    });
  }

  void goToPasswordFg() {
    setState(() {
      activeScreen = "password-forgot-screen";
    });
  }

  void goToConfirmOtp() {
    setState(() {
      activeScreen = "confirm-otp-screen";
    });
  }

  void goToOtherMethods() {
    setState(() {
      activeScreen = "auth-methods-screen";
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget;

    switch (activeScreen) {
      case "login-choice-screen":
        screenWidget = LoginChoiceScreen(
          goToLogin: goToLoginScreen,
          goToRegister: goToRegisterScreen,
        );
        break;
      case "login-screen":
        screenWidget = LoginScreen(
          goToRegister: goToRegisterScreen,
          goToLoginChoice: goToLoginChoiceScreen,
          goToPassword: goToPasswordFg,
        );
        break;
      case "register-screen":
        screenWidget = RegisterScreen(
          goToLogin: goToLoginScreen,
          goToLoginChoice: goToLoginChoiceScreen,
          goToOtherMethods: goToOtherMethods,
        );
        break;
      case "password-forgot-screen":
        screenWidget = PasswordForgotScreen(
            goToLoginScreen: goToLoginScreen, goToOtpScreen: goToConfirmOtp);
        break;
      case "confirm-otp-screen":
        screenWidget = const OTPCodeScreen();
        break;
      case "auth-methods-screen":
        screenWidget = AuthMethodsScreen(
            goToLoginScreen: goToLoginScreen, goToRegister: goToRegisterScreen);
        break;
      default:
        screenWidget = SplashScreen(
          moveToLoginChoiceScreen: goToLoginChoiceScreen,
        );
    }

    return Scaffold(
      appBar: activeScreen == "splash-screen" ||
              activeScreen == "login-choice-screen"
          ? null
          : const AuthAppBar(),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: screenWidget,
      ),
    );
  }
}
