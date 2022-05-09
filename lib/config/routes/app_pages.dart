// ignore_for_file: constant_identifier_names

import 'package:app_test/config/routes/app_routes.dart';
import 'package:app_test/presentation/views/dashboard/dashboard_binding.dart';
import 'package:app_test/presentation/views/dashboard/dashbord_page.dart';
import 'package:app_test/presentation/views/splash/splash_binding.dart';
import 'package:app_test/presentation/views/splash/splash_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(name: Routes.SPLASH, page: ()=> const SplashPage(), binding: SplashBinding()),
    GetPage(name: Routes.DASH_BOARD, page: ()=> const DashBoardPage(), binding: DashBoardBinding())
  ];
}