import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/models/news_response.dart';
import 'package:news_app/models/taps_response.dart';

class ApiManager {
  static String baseUrl = "https://newsapi.org/v2";
  static String apiKey = "132de28b0fe546609a6e9ca8c097cda3";

  static Future<TabsResponse> getTabs(String categoryId) async {
    //Uri uri = Uri.https(
      //  baseUrl, 'v2/top-headlines/sources', {'apiKey': apiKey,'&category=':technology},); // Request
    var response = await http.get(Uri.parse("$baseUrl/top-headlines/sources?category=$categoryId&apiKey=$apiKey"));
    String jsonBody = response.body;
    var json = jsonDecode(jsonBody);
    TabsResponse tabsResponse = TabsResponse.fromJson(json);
    return tabsResponse;
  }

  static Future<NewsResponse> getNews({String? tabId,int? page}) async {
    var response = await http.get(Uri.parse(
        "https://newsapi.org/v2/everything?apiKey=$apiKey&sources=$tabId&page=$page&pageSize=20"));
    var json = jsonDecode(response.body);
    NewsResponse newsResponse = NewsResponse.fromJson(json);
    return newsResponse;
  }
  static Future<NewsResponse> getNews2({String? keywordSearch}) async {
    var response = await http.get(Uri.parse(
        "https://newsapi.org/v2/everything?apiKey=$apiKey&q=$keywordSearch"));
    var json = jsonDecode(response.body);
    NewsResponse newsResponse = NewsResponse.fromJson(json);
    return newsResponse;
  }

}
