import 'package:get/get.dart';
import 'package:siya_hackers_news/app/ui/no_internet/controller/no_internet_controller.dart';

class NoInternetBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => NoInternetController());
  }
}