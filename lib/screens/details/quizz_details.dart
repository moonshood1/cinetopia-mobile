import 'package:cinetopia/common/colors.dart';
import 'package:cinetopia/models/articles_models.dart';
import 'package:flutter/material.dart';

class QuizzDetailsScreen extends StatefulWidget {
  const QuizzDetailsScreen({required this.quizz, super.key});

  final Article quizz;

  @override
  State<QuizzDetailsScreen> createState() => _QuizzDetailsScreenState();
}

class _QuizzDetailsScreenState extends State<QuizzDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    Article quizz = widget.quizz;

    Image cardImage = quizz.image;

    cardImage = Image(
      image: quizz.image.image,
      height: 400,
      width: double.infinity,
      fit: BoxFit.cover,
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(color: quizzbg),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 500,
              width: double.maxFinite,
              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5),
                      BlendMode.srcOver,
                    ),
                    child: cardImage,
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 150,
                          width: double.maxFinite,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 30,
                          ),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                quizzbg,
                                quizzbg.withOpacity(0.2),
                                Colors.transparent,
                              ],
                            ),
                          ),
                          child: null,
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 10),
                          child: Column(
                            children: [
                              Text(
                                quizz.title,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                quizz.description,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  height: 1.4,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
              child: SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    print("quizz button pressed");
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: quizzbg,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Commencer le Quizz",
                    style: TextStyle(letterSpacing: 1),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
