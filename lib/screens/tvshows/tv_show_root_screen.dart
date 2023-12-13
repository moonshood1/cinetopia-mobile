import 'package:cinetopia/common/colors.dart';
import 'package:cinetopia/data/articles_data.dart';
import 'package:cinetopia/models/articles_models.dart';
import 'package:cinetopia/widgets/cards.dart';
import 'package:cinetopia/widgets/categorie_badge.dart';
import 'package:cinetopia/widgets/home_header.dart';
import 'package:cinetopia/widgets/presentation_title.dart';
import 'package:flutter/material.dart';

class TvRootScreen extends StatefulWidget {
  const TvRootScreen({super.key});

  @override
  State<TvRootScreen> createState() => _TvRootScreenState();
}

class _TvRootScreenState extends State<TvRootScreen> {
  @override
  Widget build(BuildContext context) {
    List<Article> tvArticles = tvShows.toList();

    Article mainTv =
        mains.firstWhere((article) => article.category == "Séries");

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height / 20,
          horizontal: MediaQuery.of(context).size.width / 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SectionPresentation(
              title: "Les dernieres reviews séries",
              subTitle: "Les séries qu'on a binge watché recemment",
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Wrap(
                spacing: 20,
                children: tvArticles.sublist(0, 4).map((article) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: ImageCard(
                      article: article,
                      isOnHomePage: false,
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            HomeHeaderWidget(
              text:
                  "'House n'est pas atteint d'Asperger. Le diagnostic est plus simple : c'est un con !'",
              mainColor: tvbg,
            ),
            const SizedBox(
              height: 40,
            ),
            const SectionPresentation(
              title: "Explorez nos articles sur les séries",
              subTitle:
                  "Un condensé non filtrés de nos articles, nos reviews , nos tops et nos points de vue",
            ),
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Wrap(
                spacing: 10,
                children: [
                  CategoryBadgeSelector(
                    title: "Drame",
                    borderColor: Colors.green.withOpacity(0.6),
                  ),
                  CategoryBadgeSelector(
                    title: "Fantastique",
                    borderColor: Colors.red.withOpacity(0.6),
                  ),
                  CategoryBadgeSelector(
                    title: "Science fiction",
                    borderColor: Colors.yellow.withOpacity(0.6),
                  ),
                  CategoryBadgeSelector(
                    title: "Comédie",
                    borderColor: Colors.black.withOpacity(0.6),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              children: List.generate(
                (tvArticles.length / 4).ceil(),
                (rowIndex) {
                  int startIndex = rowIndex * 4;
                  int endIndex = startIndex + 4;
                  if (endIndex > tvArticles.length) {
                    endIndex = tvArticles.length;
                  }

                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Wrap(
                      spacing: 20,
                      children: tvArticles
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
          ],
        ),
      ),
    );
  }
}
