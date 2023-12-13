import 'package:flutter/material.dart';

class SectionPresentation extends StatelessWidget {
  const SectionPresentation(
      {super.key, required this.title, required this.subTitle});

  final String title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            subTitle,
            style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 12),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
