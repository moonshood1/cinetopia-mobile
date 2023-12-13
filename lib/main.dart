import 'package:cinetopia/screens/auth/auth_root_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthRootScreen(),
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(),
      ),
    ),
  );
}
