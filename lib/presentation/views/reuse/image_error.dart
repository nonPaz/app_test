import 'package:flutter/material.dart';
import 'package:app_test/config/app_colors.dart' as app_colors;

class ImageError extends StatelessWidget {
  const ImageError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Icon(Icons.error, color: app_colors.primary,);
  }
}