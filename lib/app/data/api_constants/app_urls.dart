import 'dart:convert';

class AppUrls {
  static String baseUrl = 'https://hacker-news.firebaseio.com/v0/';
  static String topStoriesUrl = '${baseUrl}topstories.json?print=pretty';
  static String storyDetailsUrl = '${baseUrl}item/41356181.json?print=pretty';

}