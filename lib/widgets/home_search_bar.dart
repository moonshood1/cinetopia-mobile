import 'package:cinetopia/common/colors.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key, required this.textLabel});

  final String textLabel;

  @override
  Widget build(BuildContext context) {
    return Wrap(direction: Axis.horizontal, spacing: 10, children: <Widget>[
      SizedBox(
        width: MediaQuery.of(context).size.width / 1.4,
        child: TextField(
          // controller: ,
          style: const TextStyle(fontSize: 14),
          cursorColor: Colors.black,
          decoration: InputDecoration(
            focusColor: headerbg,
            labelText: textLabel,
            labelStyle: const TextStyle(fontSize: 14, color: Color(0xFFB1B1B1)),
            suffixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.grey,
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
      ),
      IconButton(
        icon: const Icon(
          Icons.filter_alt,
          color: Colors.grey,
          size: 40,
        ),
        onPressed: () {},
      )
    ]);
  }
}
