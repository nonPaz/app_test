// ignore_for_file: must_be_immutable

import 'package:app_test/domain/entities/item_announcement_entity.dart';
import 'package:app_test/presentation/views/reuse/image_error.dart';
import 'package:app_test/presentation/views/reuse/image_loading.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app_test/config/app_colors.dart' as app_colors;

class ItemAnnouncementWidget extends StatelessWidget {
  final ItemAnnouncementEntity itemAnnouncementEntity;

  const ItemAnnouncementWidget({required this.itemAnnouncementEntity, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 40.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _imageAnnouncementView(),
          _titleAnnouncement(),
          _dateTimeAnnouncement()
        ],
      ),
    );
  }

  Widget _imageAnnouncementView()=> Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25)
    ),
    child: CachedNetworkImage(
      imageUrl: itemAnnouncementEntity.imageURL,
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
  );

  Widget _titleAnnouncement()=> Container(
    margin: EdgeInsets.only(top: 20.h),
    child: Text(itemAnnouncementEntity.title, style: TextStyle(color: app_colors.primary, fontSize: 28.sp, fontWeight: FontWeight.bold)),
  );

  Widget _dateTimeAnnouncement()=> Container(
    margin: EdgeInsets.only(top: 20.h),
    child: Text(itemAnnouncementEntity.dateTime, style: TextStyle(color: app_colors.primary, fontSize: 24.sp)),
  );
}
