import 'package:cinetopia/common/colors.dart';
import 'package:cinetopia/data/articles_data.dart';
import 'package:cinetopia/models/articles_models.dart';
import 'package:cinetopia/widgets/cards.dart';
import 'package:cinetopia/widgets/categorie_badge.dart';
import 'package:cinetopia/widgets/home_header.dart';
import 'package:cinetopia/widgets/presentation_title.dart';
import 'package:flutter/material.dart';

class QuizzRootScreen extends StatefulWidget {
  const QuizzRootScreen({super.key});

  @override
  State<QuizzRootScreen> createState() => _QuizzRootScreenState();
}

class _QuizzRootScreenState extends State<QuizzRootScreen> {
  @override
  Widget build(BuildContext context) {
    List<Article> quizzArticles = quizz.toList();

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height / 20,
          horizontal: MediaQuery.of(context).size.width / 20,
        ),
        child: Column(
          children: <Widget>[
            const SectionPresentation(
              title: "Explorez nos Quizz",
              subTitle:
                  "Affrontez vous à nos quizz et comparez vos resultats avec ceux de vos amis",
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Wrap(
                spacing: 10,
                children: [
                  CategoryBadgeSelector(
                    title: "Les séries",
                    borderColor: tvbg,
                  ),
                  CategoryBadgeSelector(
                    title: "Les Films",
                    borderColor: moviebg,
                  ),
                  CategoryBadgeSelector(
                    title: "Les plus corsés",
                    borderColor: Colors.black.withOpacity(0.6),
                  ),
                  CategoryBadgeSelector(
                    title: "Les plus legers",
                    borderColor: Colors.green.withOpacity(0.6),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              children: List.generate(
                (quizzArticles.length / 4).ceil(),
                (rowIndex) {
                  int startIndex = rowIndex * 4;
                  int endIndex = startIndex + 4;
                  if (endIndex > quizzArticles.length) {
                    endIndex = quizzArticles.length;
                  }

                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Wrap(
                      spacing: 20,
                      children: quizzArticles
                          .sublist(startIndex, endIndex)
                          .map((article) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 30),
                          child: SimpleCard(
                            article: article,
                            isOnHomePage: false,
                          ),
                        );
                      }).toList(),
                    ),
                  );
                },
              ),
            ),
            // HomeHeaderWidget(
            //   text: "'Il vaut mieux partir d’un cliché que d’y finir'",
            //   mainColor: quizzbg,
            // ),
          ],
        ),
      ),
    );
  }
}
