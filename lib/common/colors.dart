import 'package:flutter/material.dart';

Color quizzbg = const Color(0xFF18534F);
Color greenbg = const Color(0xFF226D68);
Color tvbg = const Color(0xFFD6955B);
Color moviebg = const Color(0xFFFEEAA1);
Color headerbg = const Color(0xFFECF8F6);

MaterialColor createMaterialColor(Color color) {
  List<int> strengths = <int>[50, 100, 200, 300, 400, 500, 600, 700, 800, 900];
  Map<int, Color> swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int strength in strengths) {
    final double ds = 0.5 - ((strength / 1000) * 0.5);
    swatch[strength] = Color.fromRGBO(
      r,
      g,
      b,
      ds,
    );
  }

  return MaterialColor(color.value, swatch);
}
