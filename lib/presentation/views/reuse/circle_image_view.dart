// ignore_for_file: must_be_immutable

import 'package:app_test/presentation/views/reuse/image_error.dart';
import 'package:app_test/presentation/views/reuse/image_loading.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app_test/config/app_colors.dart' as app_colors;

class CircleImageView extends StatelessWidget {

  double? _height, _width;
  String? _strImageNetWork;

  CircleImageView({
    required double height,
    required double width,
    required String strImageNetWork,
    Key? key}) : super(key: key)
  {
    _height = height;
    _width = width;
    _strImageNetWork = strImageNetWork;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.w),
      decoration: const BoxDecoration(
        color: app_colors.primary,
        shape: BoxShape.circle
      ),
      height: _height,
      width: _width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: CachedNetworkImage(
          imageUrl: _strImageNetWork!,
          fit: BoxFit.cover,
          placeholder: (context, url) => SizedBox(
              width: 200.w,
              height: 200.w,
              child: ImageLoading()),
          errorWidget: (context, url, error) => SizedBox(
              width: 200.w,
              height: 200.w,
              child: const ImageError()),
        ),
      ),
    );
  }
}
