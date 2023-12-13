import 'package:flutter/material.dart';

class CategoryBadgeSelector extends StatelessWidget {
  const CategoryBadgeSelector(
      {super.key,
      required this.title,
      // required this.filterFunction,
      required this.borderColor});

  final String title;
  // final void Function() filterFunction;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          title,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
        ),
      ),
    );
  }
}
