import 'package:dio/dio.dart';

import '../api_constants/app_urls.dart';
import '../api_services/dio_api_services.dart';

class PostsProvider {
  Dio client;
  PostsProvider({required this.client});
  final _apiServices = DioApiServices();

  Future<dynamic> getAllPostIdsApi() async {
    dynamic response = await _apiServices.getApi(client: client,url: AppUrls.topStoriesUrl);
    return response;
  }

  Future<dynamic> getPostDetailsApi({required String postId}) async {
    dynamic response = await _apiServices.getApi(client: client,url: '${AppUrls.baseUrl}item/$postId.json?print=pretty');
    return response;
  }

  Future<dynamic> getPostCommentsApi({required String commentId}) async {
    dynamic response = await _apiServices.getApi(client: client,url: '${AppUrls.baseUrl}item/$commentId.json?print=pretty');
    return response;
  }

}