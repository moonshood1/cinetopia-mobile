import 'package:flutter/material.dart';
import 'package:cinetopia/screens/auth/widgets/auth_header_widget.dart';
import 'package:cinetopia/common/colors.dart';

class OTPCodeScreen extends StatefulWidget {
  const OTPCodeScreen({super.key});

  @override
  State<OTPCodeScreen> createState() => _OTPCodeScreenState();
}

class _OTPCodeScreenState extends State<OTPCodeScreen> {
  @override
  Widget build(BuildContext context) {
    double pageHeight = MediaQuery.of(context).size.height;
    double pageWidth = MediaQuery.of(context).size.width;

    final List<TextEditingController> controllers =
        List.generate(5, (index) => TextEditingController());

    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: pageHeight / 15, horizontal: pageWidth / 15),
            child: Column(
              children: [
                const AuthHeaderWidget(
                  text:
                      "Entrez le code OTP que vous avez reçu sur votre adresse email",
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    5,
                    (index) {
                      return SizedBox(
                        width: 50,
                        child: TextField(
                          cursorColor: Colors.black,
                          controller: controllers[index],
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          decoration: InputDecoration(
                            counter: const Offstage(),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1.0,
                              ),
                            ),
                            focusColor: headerbg,
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(width: 2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Vérifier le code ",
                      style: TextStyle(letterSpacing: 1),
                    ),
                  ),
                ),
                const SizedBox(height: 250),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "OTP non reçu ?",
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Renvoyer",
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
