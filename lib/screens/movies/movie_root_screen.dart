import 'package:cinetopia/common/colors.dart';
import 'package:cinetopia/data/articles_data.dart';
import 'package:cinetopia/models/articles_models.dart';
import 'package:cinetopia/widgets/cards.dart';
import 'package:cinetopia/widgets/categorie_badge.dart';
import 'package:cinetopia/widgets/home_header.dart';
import 'package:cinetopia/widgets/presentation_title.dart';
import 'package:flutter/material.dart';

class MovieRootScreen extends StatefulWidget {
  const MovieRootScreen({super.key});

  @override
  State<MovieRootScreen> createState() => _MovieRootScreenState();
}

class _MovieRootScreenState extends State<MovieRootScreen> {
  @override
  Widget build(BuildContext context) {
    List<Article> movieArticles = movies.toList();

    Article mainMovie =
        mains.firstWhere((article) => article.category == "Films");

    int startIndex = 0;

    List<Article> getRows(List<Article> articles) {
      int endIndex = startIndex + 3;
      if (endIndex > articles.length) {
        endIndex = articles.length;
      }
      List<Article> result = articles.sublist(startIndex, endIndex);
      startIndex = endIndex;
      return result;
    }

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
              title: "Les dernières sorties ciné ",
              subTitle: "Les films qu'on a vu recemment en salles",
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Wrap(
                spacing: 20,
                children: movieArticles.sublist(0, 4).map((article) {
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
                  "'Je ne veux parler que de cinéma , pourquoi parler d’autre chose ? Avec le cinéma on parle de tout , on arrive à tout'",
              mainColor: moviebg,
            ),
            const SizedBox(
              height: 40,
            ),
            const SectionPresentation(
              title: "Explorez nos articles sur les films",
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
                    title: "Les critiques",
                    borderColor: Colors.green.withOpacity(0.6),
                  ),
                  CategoryBadgeSelector(
                    title: "Coups de coeur",
                    borderColor: Colors.blue.withOpacity(0.6),
                  ),
                  CategoryBadgeSelector(
                    title: "Nos tops",
                    borderColor: Colors.black.withOpacity(0.6),
                  ),
                  CategoryBadgeSelector(
                    title: "Drame",
                    borderColor: Colors.purple.withOpacity(0.6),
                  ),
                  CategoryBadgeSelector(
                    title: "Science fiction",
                    borderColor: Colors.red.withOpacity(0.6),
                  ),
                  CategoryBadgeSelector(
                    title: "Fantastique",
                    borderColor: Colors.brown.withOpacity(0.6),
                  ),
                  // CategoryBadgeSelector(
                  //   title: "Science fiction",
                  //   borderColor: Colors.purple.withOpacity(0.6),
                  // ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              children: List.generate(
                (movieArticles.length / 4).ceil(),
                (rowIndex) {
                  int startIndex = rowIndex * 4;
                  int endIndex = startIndex + 4;
                  if (endIndex > movieArticles.length) {
                    endIndex = movieArticles.length;
                  }

                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Wrap(
                      spacing: 20,
                      children: movieArticles
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
