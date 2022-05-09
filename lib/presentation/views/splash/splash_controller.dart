import 'dart:async';
import 'package:app_test/config/routes/app_routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController{

  Timer? _timer;

  @override
  void onInit() {
    _timer = Timer(const Duration(seconds: 4), ()=> Get.offNamedUntil(Routes.DASH_BOARD, (route) => false));
    super.onInit();
  }

  @override
  void onClose() {
    _timer!.cancel();
    super.onClose();
  }
}