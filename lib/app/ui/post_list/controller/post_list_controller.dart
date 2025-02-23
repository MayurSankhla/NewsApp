import 'dart:convert';

import 'package:get/get.dart';
import 'package:siya_hackers_news/app/data/providers/posts_provider.dart';

import '../../../data/api_services/api_client.dart';
import '../../../data/models/post_details.dart';

class PostListController extends GetxController{
  var isLoading = true.obs;
  RxList<String> postIds = <String>[].obs;
  RxList<PostDetails> postsList = <PostDetails>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchPostIds();
  }

  Future<void> fetchPostIds() async {
    DioClient client = DioClient();
    final api = PostsProvider(client: client.init());
    api.getAllPostIdsApi().then((response) async {
      postIds.value = List<String>.from(response.map((e) => e.toString()));
      await fetchPostDetails(postIds.value);
    });
  }

  Future<void> fetchPostDetails(List<dynamic> ids) async {
    isLoading.value = true;
    DioClient client = DioClient();
    final api = PostsProvider(client: client.init());
    RxList<PostDetails> posts = <PostDetails>[].obs;
    for(var id in ids){
      api.getPostDetailsApi(postId: id.toString()).then((response) {
        posts.add(PostDetails.fromJson(response));
        postsList.assignAll(posts);
      }).then((value) {
        isLoading.value = false;
      });
    }
  }

}