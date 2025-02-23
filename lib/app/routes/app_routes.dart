import 'package:get/get.dart';
import 'package:siya_hackers_news/app/routes/route_names.dart';
import 'package:siya_hackers_news/app/ui/no_internet/binding/no_internet_binding.dart';
import 'package:siya_hackers_news/app/ui/no_internet/no_internet_screen.dart';
import 'package:siya_hackers_news/app/ui/post_details/binding/post_details_binding.dart';
import 'package:siya_hackers_news/app/ui/post_details/post_details_screen.dart';
import 'package:siya_hackers_news/app/ui/post_list/binding/post_list_binding.dart';
import 'package:siya_hackers_news/app/ui/post_list/post_list_screen.dart';

import '../ui/splash/binding/splash_binding.dart';
import '../ui/splash/splash_screen.dart';

class AppRoutes {
  static List<GetPage> pages = [
    GetPage(
      name: RouteNames.splashRoute,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: RouteNames.postListRoute,
      page: () => PostListScreen(),
      binding: PostListBinding(),
    ),
    GetPage(
      name: RouteNames.noInternetRoute,
      page: () => NoInternetScreen(),
      binding: NoInternetBinding(),
    ),
    GetPage(
      name: RouteNames.postDetailsRoute,
      page: () => PostDetailsScreen(),
      binding: PostDetailsBinding(),
    ),
  ];

}