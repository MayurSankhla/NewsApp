import 'package:get/get.dart';
import 'package:siya_hackers_news/app/ui/post_details/controller/post_details_controller.dart';

class PostDetailsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => PostDetailsController());
  }
}