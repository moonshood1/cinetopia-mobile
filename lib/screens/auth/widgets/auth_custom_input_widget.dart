import 'package:cinetopia/common/colors.dart';
import 'package:flutter/material.dart';

class CustomInputWidget extends StatelessWidget {
  const CustomInputWidget(
      {super.key, required this.textLabel, required this.isPassword});

  final String textLabel;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextField(
        // controller: ,
        style: const TextStyle(fontSize: 14),
        obscureText: isPassword,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          focusColor: headerbg,
          labelText: textLabel,
          labelStyle: const TextStyle(fontSize: 14, color: Color(0xFFB1B1B1)),
          suffixIcon: isPassword
              ? const Icon(
                  Icons.remove_red_eye,
                  color: Colors.grey,
                )
              : null,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide: BorderSide(
              color: Colors.black,
              width: 1.0,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide: BorderSide(
              color: Colors.black,
              width: 2.0,
            ),
          ),
        ),
      ),
    );
  }
}
