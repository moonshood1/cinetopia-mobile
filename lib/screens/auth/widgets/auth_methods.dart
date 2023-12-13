import 'package:cinetopia/screens/auth/models/sign_methods.dart';
import 'package:flutter/material.dart';
import 'package:cinetopia/common/images.dart';

class AuthMethods extends StatefulWidget {
  const AuthMethods({required this.isMethod, super.key});

  final bool isMethod;

  @override
  State<AuthMethods> createState() => _AuthMethodsState();
}

class _AuthMethodsState extends State<AuthMethods> {
  @override
  Widget build(BuildContext context) {
    void signWithGoogle() {}
    void signWithApple() {}
    void signWithFacebook() {}

    List<SignUpData> signData = [
      SignUpData(googleLogo, signWithGoogle, "Lier votre compte google"),
      SignUpData(facebookLogo, signWithFacebook, "Lier votre compte Facebook"),
      SignUpData(appleLogo, signWithApple, "Lier votre compte ICloud")
    ].toList();

    final bool alignRow = widget.isMethod;
    return Wrap(
      direction: alignRow ? Axis.vertical : Axis.horizontal,
      spacing: 20,
      children: [
        ...signData.map(
          (e) => MethodContainerWidget(
            alignRow: alignRow,
            logo: e.picture,
            title: e.title,
            signFunction: e.signMethod,
          ),
        ),
      ],
    );
  }
}

class MethodContainerWidget extends StatelessWidget {
  const MethodContainerWidget(
      {super.key,
      required this.alignRow,
      required this.logo,
      required this.title,
      required this.signFunction});

  final bool alignRow;
  final Image logo;
  final String title;
  final void Function() signFunction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        alignment: alignRow ? Alignment.topLeft : null,
        width: alignRow ? 300 : null,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        child: alignRow
            ? Row(
                children: [
                  const Spacer(),
                  logo,
                  const Spacer(),
                  Text(title),
                  const Spacer(),
                ],
              )
            : logo,
      ),
    );
  }
}
