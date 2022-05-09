import 'package:app_test/presentation/views/splash/splash_controller.dart';
import 'package:app_test/presentation/widgets/reuse/loading_lottie_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends GetView<SplashController>{
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const LoadingLottieWidget();
  }
}