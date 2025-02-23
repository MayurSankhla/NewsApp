import 'package:get/get.dart';
import 'package:siya_hackers_news/app/ui/no_internet/controller/no_internet_controller.dart';

import '../../../routes/route_names.dart';

class SplashController extends GetxController{

  final NoInternetController _internetController = Get.put(NoInternetController());

  @override
  void onInit() {
    _internetController.checkConnection().then((value) {
      Future.delayed(Duration(seconds: 3)).then((value) {
        if (!_internetController.isConnected.value) {
          Get.offAndToNamed(RouteNames.noInternetRoute);
          return;
        }else{
          Get.offAndToNamed(RouteNames.postListRoute);
          return;
        }
      });
    });
    super.onInit();
  }
}