import 'package:cinetopia/models/articles_models.dart';
import 'package:flutter/material.dart';

class MovieTvDetailScreen extends StatelessWidget {
  const MovieTvDetailScreen(
      {required this.article, required this.bgColor, super.key});

  final Article article;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    String articleAuthor = article.author;
    // String articleDate = article.publishedAt;
    String articleDuration = article.duration;

    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: bgColor.withOpacity(0.10),
              ),
            ),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                bgColor,
                Colors.white,
              ],
            ),
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height / 20,
                  horizontal: MediaQuery.of(context).size.width / 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Par $articleAuthor",
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.watch_later_outlined,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "$articleDuration minutes de lecture",
                          style: const TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                    // Row(
                    //   children: [
                    //     const Icon(
                    //       Icons.calendar_month,
                    //     ),
                    //     const SizedBox(
                    //       width: 5,
                    //     ),
                    //     Text(
                    //       articleDate,
                    //       style: const TextStyle(fontSize: 12),
                    //     )
                    //   ],
                    // ),
                  ],
                ),
              ),
              article.image,
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 20,
                    vertical: 0),
                child: Text(
                  article.article,
                  style: const TextStyle(fontSize: 16, height: 2),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
