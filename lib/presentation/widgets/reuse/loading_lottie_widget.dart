import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingLottieWidget extends StatelessWidget {
  const LoadingLottieWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Lottie.asset('images/lottie/loading_lottie.zip');
  }
}
