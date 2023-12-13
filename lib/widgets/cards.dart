import 'package:cinetopia/screens/details/movie_tv_details.dart';
import 'package:cinetopia/screens/details/quizz_details.dart';
import 'package:cinetopia/models/articles_models.dart';
import 'package:flutter/material.dart';
import 'package:cinetopia/common/colors.dart';

class MainCard extends StatelessWidget {
  const MainCard({required this.article, super.key});

  final Article article;

  @override
  Widget build(BuildContext context) {
    Image cardImage = article.image;

    cardImage = Image(
      image: article.image.image,
      width: 130,
      height: 110,
      fit: BoxFit.cover,
    );

    Color cardBack;
    Color cardBackTextColor;

    String cardDuration = article.duration;

    switch (article.category) {
      case "Films":
        cardBack = moviebg;
        cardBackTextColor = Colors.black;
        break;
      case "Séries":
        cardBack = tvbg;
        cardBackTextColor = Colors.white;
        break;
      default:
        cardBack = quizzbg;
        cardBackTextColor = Colors.white;
    }

    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => article.category != "Quizz"
              ? MovieTvDetailScreen(
                  bgColor: cardBack,
                  article: article,
                )
              : QuizzDetailsScreen(quizz: article),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.black.withOpacity(0.15),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              offset: const Offset(0, 4),
              color: Colors.black.withOpacity(0.25),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        article.title,
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: <Widget>[
                          const Icon(
                            Icons.access_time,
                            size: 16,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            article.publishedAt,
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                cardImage
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              child: Text(
                article.description,
                style: const TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w300, height: 1.7),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CategoryBadge(
                      cardBack: cardBack,
                      article: article,
                      cardBackTextColor: cardBackTextColor),
                  Row(
                    children: <Widget>[
                      const Icon(
                        Icons.timer_outlined,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        "$cardDuration minutes",
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BaseCard extends StatelessWidget {
  const BaseCard({required this.article, super.key});

  final Article article;
  @override
  Widget build(BuildContext context) {
    final widgetParams = _buildDefaultParams(article);

    String cardDuration = widgetParams['cardDuration'];

    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => article.category != "Quizz"
              ? MovieTvDetailScreen(
                  bgColor: widgetParams['cardBackgroundColor'],
                  article: article,
                )
              : QuizzDetailsScreen(quizz: article),
        ),
      ),
      child: Container(
        width: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.black.withOpacity(0.15),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              offset: const Offset(0, 4),
              color: Colors.black.withOpacity(0.25),
            ),
          ],
        ),
        child: Column(
          children: [
            SizedBox(
              height: 150,
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.5),
                        BlendMode.srcOver,
                      ),
                      child: widgetParams['cardImage'],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: Text(
                      article.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 25,
                        height: 1.4,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: <Widget>[
                  Text(
                    article.description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(height: 1.7, fontSize: 14),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CategoryBadge(
                          cardBack: widgetParams['cardBackgroundColor'],
                          article: article,
                          cardBackTextColor: widgetParams['cardBackTextColor']),
                      Row(
                        children: <Widget>[
                          const Icon(
                            Icons.timer_outlined,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            "$cardDuration minutes",
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InlineCard extends StatelessWidget {
  const InlineCard({super.key, required this.article, required this.isQuizz});

  final Article article;
  final bool isQuizz;

  @override
  Widget build(BuildContext context) {
    Image cardImage = article.image;

    cardImage = Image(
      image: article.image.image,
      fit: BoxFit.fill,
    );

    Color cardBack = isQuizz
        ? quizzbg
        : article.category == "Films"
            ? moviebg
            : tvbg;

    String articleTitle = article.title;

    return Container(
      width: 200,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.black.withOpacity(0.15),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            offset: const Offset(0, 4),
            color: Colors.black.withOpacity(0.25),
          ),
        ],
      ),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                cardBack.withOpacity(0.4),
                BlendMode.srcOver,
              ),
              child: cardImage,
            ),
          ),
          Container(
            padding:
                const EdgeInsets.only(top: 10, bottom: 2, left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  isQuizz ? "Quizz :  $articleTitle" : articleTitle,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isQuizz ? Colors.white : Colors.black,
                    fontSize: 16,
                    height: 1.4,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextButton.icon(
                  onPressed: () => isQuizz
                      ? print("show Score")
                      : Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MovieTvDetailScreen(
                              bgColor: cardBack,
                              article: article,
                            ),
                          ),
                        ),
                  icon: Icon(
                    Icons.arrow_forward,
                    color: isQuizz ? Colors.white : Colors.black,
                  ),
                  label: Text(
                    isQuizz ? "Mon score" : "Consulter",
                    style: TextStyle(
                        color: isQuizz ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ImageCard extends StatelessWidget {
  const ImageCard(
      {super.key, required this.article, required this.isOnHomePage});

  final Article article;
  final bool isOnHomePage;

  @override
  Widget build(BuildContext context) {
    final widgetParams = _buildDefaultParams(article);

    String cardDuration = widgetParams['cardDuration'];

    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => article.category != "Quizz"
              ? MovieTvDetailScreen(
                  bgColor: widgetParams['cardBackgroundColor'],
                  article: article,
                )
              : QuizzDetailsScreen(quizz: article),
        ),
      ),
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 2,
        margin: const EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          height: 300,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                offset: const Offset(0, 4),
                color: Colors.black.withOpacity(0.25),
              ),
            ],
          ),
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5),
                    BlendMode.srcOver,
                  ),
                  child: widgetParams['cardImage'],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topRight,
                      child: isOnHomePage
                          ? CategoryBadge(
                              cardBack: widgetParams['cardBackgroundColor'],
                              article: article,
                              cardBackTextColor:
                                  widgetParams['cardBackTextColor'],
                            )
                          : null,
                    ),
                    const Spacer(),
                    Text(
                      article.title,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20,
                        height: 1.4,
                      ),
                    ),
                    Text(
                      article.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: <Widget>[
                            const Icon(Icons.timer_outlined,
                                color: Colors.white),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              "$cardDuration minutes",
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: const Icon(
                            Icons.bookmark,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryBadge extends StatelessWidget {
  const CategoryBadge({
    super.key,
    required this.cardBack,
    required this.article,
    required this.cardBackTextColor,
  });

  final Color cardBack;
  final Article article;
  final Color cardBackTextColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 4,
        ),
        decoration: BoxDecoration(
          color: cardBack,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: cardBack),
        ),
        child: Text(
          article.category,
          style: TextStyle(fontSize: 12, color: cardBackTextColor),
        ),
      ),
    );
  }
}

class SimpleCard extends StatelessWidget {
  const SimpleCard(
      {super.key, required this.article, required this.isOnHomePage});

  final Article article;
  final bool isOnHomePage;

  @override
  Widget build(BuildContext context) {
    final widgetParams = _buildDefaultParams(article);

    String cardDuration = widgetParams['cardDuration'];

    Image cardImage = article.image;

    cardImage = Image(
      image: article.image.image,
      width: double.infinity,
      height: 120,
      fit: BoxFit.cover,
    );

    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => article.category != "Quizz"
              ? MovieTvDetailScreen(
                  bgColor: widgetParams['cardBackgroundColor'],
                  article: article,
                )
              : QuizzDetailsScreen(quizz: article),
        ),
      ),
      child: SizedBox(
        width: 230,
        child: Column(
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  cardImage,
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: isOnHomePage
                          ? CategoryBadge(
                              cardBack: widgetParams['cardBackgroundColor'],
                              article: article,
                              cardBackTextColor:
                                  widgetParams['cardBackTextColor'],
                            )
                          : null,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              article.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: 16,
                height: 1.2,
              ),
            ),
            SizedBox(
              height: article.category != "Quizz" ? 5 : 0,
            ),
            Text(
              article.article,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.w200,
                color: Colors.black,
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: article.category != "Quizz" ? 8 : 0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: <Widget>[
                    const Icon(Icons.timer_outlined, size: 20),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      "$cardDuration minutes",
                      style: const TextStyle(fontSize: 10),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.bookmark,
                    size: 30,
                    color: Colors.black,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

Map<String, dynamic> _buildDefaultParams(Article article) {
  String cardDuration = article.duration;

  Color cardBackgroundColor;
  Color cardBackTextColor;

  Image cardImage = article.image;

  cardImage = Image(
    image: article.image.image,
    fit: BoxFit.cover,
    height: 330,
    width: 200,
  );

  switch (article.category) {
    case "Films":
      cardBackgroundColor = moviebg;
      cardBackTextColor = Colors.black;
      break;
    case "Séries":
      cardBackgroundColor = tvbg;
      cardBackTextColor = Colors.white;
      break;
    default:
      cardBackgroundColor = quizzbg;
      cardBackTextColor = Colors.white;
  }

  return {
    'cardDuration': cardDuration,
    'cardBackgroundColor': cardBackgroundColor,
    'cardBackTextColor': cardBackTextColor,
    'cardImage': cardImage,
  };
}
