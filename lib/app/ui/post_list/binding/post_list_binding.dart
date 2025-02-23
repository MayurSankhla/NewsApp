import 'package:get/get.dart';
import 'package:siya_hackers_news/app/ui/post_list/controller/post_list_controller.dart';

class PostListBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => PostListController());
  }
}