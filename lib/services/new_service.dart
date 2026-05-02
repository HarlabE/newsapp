import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp/models/article.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class NewService {
  final String apiKey = dotenv.env['NEWS_API_KEY'] ?? '';
  final String baseUrl = 'https://newsapi.org/v2';

  Future<List<Article>> getHeadlines() async {
    final response = await http.get(
      Uri.parse('$baseUrl/top-headlines?country=us&apiKey=$apiKey'),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      List<dynamic> body = jsonResponse['articles'];
      List<Article> articles = body
          .map((item) => Article.fromJson(item))
          .toList();
      return articles;
    } else {
      throw Exception("failed to load news");
    }
  }
}
