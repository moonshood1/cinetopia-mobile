import 'package:flutter/material.dart';

class Article {
  const Article(
      this.title,
      this.description,
      this.image,
      this.category,
      this.duration,
      this.publishedAt,
      this.author,
      this.article,
      this.mediaTitle,
      {this.questions});

  final String title,
      description,
      category,
      duration,
      publishedAt,
      author,
      article,
      mediaTitle;
  final Image image;
  final List<String>? questions;
}
