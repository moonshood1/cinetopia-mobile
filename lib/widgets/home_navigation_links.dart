import 'package:cinetopia/common/colors.dart';
import 'package:flutter/material.dart';

class HomeLinks extends StatelessWidget {
  const HomeLinks(
      {required this.toMovies,
      required this.toTvs,
      required this.toQuizz,
      super.key});

  final Function() toMovies, toTvs, toQuizz;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              color: moviebg,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: moviebg),
            ),
            child: const Text(
              "Films",
              style: TextStyle(fontSize: 14),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              color: tvbg,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: tvbg),
            ),
            child: const Text(
              "Séries",
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
          ),
        ),
        GestureDetector(
          // onTap: () => toQuizz(),
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              color: quizzbg,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: quizzbg),
            ),
            child: const Text(
              "Quizz",
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}
