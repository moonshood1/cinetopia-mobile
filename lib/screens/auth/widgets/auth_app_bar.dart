import 'package:flutter/material.dart';
import 'package:cinetopia/common/colors.dart';

class AuthAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const AuthAppBar({super.key}) : preferredSize = const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: null,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: headerbg),
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              headerbg,
              Colors.white,
            ],
          ),
        ),
      ),
      leading: const BackButton(
        color: Colors.black,
      ),
    );
  }
}
