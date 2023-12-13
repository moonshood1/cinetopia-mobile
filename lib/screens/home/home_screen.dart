import 'package:cinetopia/data/articles_data.dart';
import 'package:cinetopia/models/articles_models.dart';
import 'package:cinetopia/widgets/cards.dart';
import 'package:cinetopia/widgets/presentation_title.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen(
      {required this.goToMovies,
      required this.goToTvs,
      required this.goToQuizz,
      super.key});

  final void Function() goToMovies, goToTvs, goToQuizz;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    List<Article> movieArticles = movies.toList();
    List<Article> tvArticles = tvShows.toList();
    List<Article> quizzArticles = quizz.toList();
    List<Article> mainArticles = mains.toList();

    Article mainMovie =
        mainArticles.firstWhere((article) => article.category == "Films");

    Article maintTv =
        mainArticles.firstWhere((article) => article.category == "Séries");

    Article mainQuizz =
        mainArticles.firstWhere((article) => article.category == "Quizz");

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.width / 20,
              horizontal: MediaQuery.of(context).size.width / 20,
            ),
            child: Column(
              children: [
                const SectionPresentation(
                  title: "Les sorties de la semaine",
                  subTitle:
                      "Nos reviews,  nos decouvertes et nos quizz sortie cette semaine",
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Wrap(
                    direction: Axis.horizontal,
                    spacing: 20,
                    children: <Widget>[
                      ImageCard(
                        article: mainMovie,
                        isOnHomePage: true,
                      ),
                      ImageCard(
                        article: maintTv,
                        isOnHomePage: true,
                      ),
                      ImageCard(
                        article: mainQuizz,
                        isOnHomePage: true,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                const SectionPresentation(
                  title: "Les plus vus",
                  subTitle: "Nos articles et quizz les plus consultés ce mois",
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Wrap(
                    direction: Axis.horizontal,
                    spacing: 20,
                    children: <Widget>[
                      ...tvArticles.sublist(0, 3).map(
                            (el) => SimpleCard(
                              article: el,
                              isOnHomePage: true,
                            ),
                          )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                const SectionPresentation(
                  title: "Nos découvertes",
                  subTitle:
                      "Nos films et séries qu’on a été surpris de découvrir dernièrement",
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Wrap(
                    direction: Axis.horizontal,
                    spacing: 20,
                    children: <Widget>[
                      ...movieArticles.sublist(0, 3).map(
                            (el) => ImageCard(
                              article: el,
                              isOnHomePage: true,
                            ),
                          )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                const SectionPresentation(
                  title: "Les TOP du moment",
                  subTitle:
                      "Nos différents TOP Films / Séries de ce mois de Novembre",
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Wrap(
                    direction: Axis.horizontal,
                    spacing: 20,
                    children: <Widget>[
                      ...quizzArticles.sublist(0, 3).map(
                            (el) => SimpleCard(
                              article: el,
                              isOnHomePage: true,
                            ),
                          )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
