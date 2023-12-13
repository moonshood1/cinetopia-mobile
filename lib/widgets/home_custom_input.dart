import 'package:cinetopia/common/colors.dart';
import 'package:flutter/material.dart';

class HomeCustomInput extends StatefulWidget {
  const HomeCustomInput(
      {super.key,
      required this.textLabel,
      required this.isPassword,
      required this.defaultValue,
      required this.hasDefaultValue});

  final String textLabel, defaultValue;
  final bool isPassword, hasDefaultValue;

  @override
  State<HomeCustomInput> createState() => _HomeCustomInputState();
}

class _HomeCustomInputState extends State<HomeCustomInput> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = widget.defaultValue;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextField(
        controller: _controller,
        style: const TextStyle(fontSize: 14),
        obscureText: widget.isPassword,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          focusColor: headerbg,
          labelText: widget.textLabel,
          labelStyle: const TextStyle(
              fontSize: 14, color: Color.fromARGB(255, 78, 78, 78)),
          suffixIcon: widget.isPassword
              ? GestureDetector(
                  onTap: () => print("show password tapped"),
                  child: const Icon(
                    Icons.remove_red_eye,
                    color: Colors.grey,
                  ),
                )
              : GestureDetector(
                  onTap: () => print("edit tapped"),
                  child: const Icon(
                    Icons.edit,
                    color: Color.fromARGB(255, 78, 78, 78),
                  ),
                ),
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
