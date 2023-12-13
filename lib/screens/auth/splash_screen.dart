import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cinetopia/common/colors.dart';
import 'package:cinetopia/common/images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({required this.moveToLoginChoiceScreen, super.key});

  final void Function() moveToLoginChoiceScreen;

  @override
  Widget build(BuildContext context) {
    const timeoutDuration = Duration(seconds: 5);
    Future.delayed(timeoutDuration, () {
      moveToLoginChoiceScreen();
    });

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
          // ),
          const Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}

class DotsWidget extends StatelessWidget {
  const DotsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50), color: quizzbg),
          width: 15,
          height: 15,
          margin: const EdgeInsets.only(right: 10),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50), color: moviebg),
          width: 15,
          height: 15,
          margin: const EdgeInsets.only(right: 10),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50), color: tvbg),
          width: 15,
          height: 15,
        ),
      ],
    );
  }
}
