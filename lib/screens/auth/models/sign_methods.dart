import 'package:flutter/material.dart';

class SignUpData {
  const SignUpData(this.picture, this.signMethod, this.title);
  final void Function() signMethod;
  final String title;
  final Image picture;
}
