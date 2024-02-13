import 'dart:convert';
import 'package:cinetopia/models/article.dart';
import 'package:cinetopia/models/quote.dart';
import 'package:http/http.dart' as http;
import 'package:cinetopia/common/api.dart';

import '../models/quizz.dart';

class ResourceService {
  Future<List<dynamic>> getMediaWelcomePage() async {
    final url = Uri.parse("$baseUrl/resources/");

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    // final Map<String, dynamic> responseData = json.decode(response.body);
    final List<dynamic> responseData = json.decode(response.body);

    if (response.statusCode == 200) {
      List<dynamic> mediaList = responseData.map((item) {
        if (item['type'] == 'article') {
          return Article.fromJson(item);
        } else if (item['type'] == 'quote') {
          return Quote.fromJson(item);
        } else if (item['type'] == 'quizz') {
          return Quizz.fromJson(item);
        } else {
          return null;
        }
      }).toList();

      return mediaList;
    } else {
      // String errorMessage = responseData['message'];
      // throw errorMessage;
      throw Exception("");
    }
  }

  Future<List<Map<String, dynamic>>> getRandomMedia() async {
    final url = Uri.parse("$baseUrl/resources/random-media");

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    final Map<String, dynamic> responseData = json.decode(response.body);

    if (response.statusCode == 200) {
      return [];
    } else {
      String errorMessage = responseData['message'];
      throw errorMessage;
    }
  }

  Future<List<Article>> getMovies() async {
    final url = Uri.parse("$baseUrl/resources/movies");

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    final Map<String, dynamic> responseData = json.decode(response.body);

    if (response.statusCode == 200) {
      return [];
    } else {
      String errorMessage = responseData['message'];
      throw errorMessage;
    }
  }

  Future<List<Article>> getTvs() async {
    final url = Uri.parse("$baseUrl/resources/tvs");

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    final Map<String, dynamic> responseData = json.decode(response.body);

    if (response.statusCode == 200) {
      return [];
    } else {
      String errorMessage = responseData['message'];
      throw errorMessage;
    }
  }

  Future<List<Quizz>> getQuizzes() async {
    final url = Uri.parse("$baseUrl/resources/quizz");

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    final Map<String, dynamic> responseData = json.decode(response.body);

    if (response.statusCode == 200) {
      return [];
    } else {
      String errorMessage = responseData['message'];
      throw errorMessage;
    }
  }

  Future<List<Quote>> getQuotes() async {
    final url = Uri.parse("$baseUrl/resources/quotes");

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    final Map<String, dynamic> responseData = json.decode(response.body);

    if (response.statusCode == 200) {
      return [];
    } else {
      String errorMessage = responseData['message'];
      throw errorMessage;
    }
  }
}
