import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_routes.dart';
import 'app/routes/route_names.dart';
import 'app/ui/splash/binding/splash_binding.dart';
import 'app/utils/common_widgets/dismiss_keyboard.dart';

//Developer - Mayur Sankhla

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
      child: GetMaterialApp(
        title: 'SiyaHackersNews',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        defaultTransition: Transition.fade,
        getPages: AppRoutes.pages,
        initialBinding: SplashBinding(),
        initialRoute: RouteNames.splashRoute,
      ),
    );
  }
}