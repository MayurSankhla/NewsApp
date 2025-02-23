import 'package:get/get.dart';
import 'package:siya_hackers_news/app/data/models/post_comment.dart';

import '../../../data/api_services/api_client.dart';
import '../../../data/models/post_details.dart';
import '../../../data/providers/posts_provider.dart';

class PostDetailsController extends GetxController{
  var arguments = Get.arguments;
  var isLoading = true.obs;
  RxInt postId = 0.obs;
  Rx<PostDetails> post = PostDetails().obs;
  RxList<PostComment> postCommentList = <PostComment>[].obs;
  RxList<PostComment> postComments = <PostComment>[].obs;

  @override
  void onInit() {
    if(arguments != null){
      postId.value = arguments['id'];
    }
    fetchPostDetails();
    super.onInit();
  }

  //fetching details
  Future<void> fetchPostDetails() async {
    isLoading.value = true;
    DioClient client = DioClient();
    final api = PostsProvider(client: client.init());
    await api.getPostDetailsApi(postId: postId.value.toString()).then((response) async {
      post.value = PostDetails.fromJson(response);
      postComments.value = [];
      for(var cId in post.value.kids ?? []){
        await fetchPostComments(cId.toString());
      }
    }).then((value) {
      isLoading.value = false;
    });
  }

  Future<void> fetchPostComments(String id) async {
    isLoading.value = true;
    DioClient client = DioClient();
    final api = PostsProvider(client: client.init());
    await api.getPostCommentsApi(commentId: id).then((response) {
      postComments.add(PostComment.fromJson(response));
      postCommentList.assignAll(postComments);
    }).then((value) {
      isLoading.value = false;
    });
  }
}