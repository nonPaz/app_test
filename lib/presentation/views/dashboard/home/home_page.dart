// ignore_for_file: must_be_immutable

import 'package:app_test/core/view_state.dart';
import 'package:app_test/presentation/views/dashboard/home/home_controller.dart';
import 'package:app_test/presentation/views/reuse/circle_image_view.dart';
import 'package:app_test/presentation/widgets/home/item_announcement_widget.dart';
import 'package:flutter/material.dart';
import 'package:app_test/config/app_colors.dart' as app_colors;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController>{
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: app_colors.bg,
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          shrinkWrap: true,
          children: [
            _headerPage(),
            _topMenu(),
            _bodyPage()
          ],
        )
      )
    );
  }

  Widget _headerPage()=> Container(
    margin: EdgeInsets.only(top: 50.h),
    padding: EdgeInsets.symmetric(horizontal: 30.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Obx(()=> controller.viewState.value == ViewState.LOADING
            ? Container()
            : CircleImageView(
            height: 120.w,
            width: 120.w,
            strImageNetWork: controller.getUserInfoObservable.value!.imageProfile
        )),
        Column(
          children: [
            Text('MQDC', style: TextStyle(color: app_colors.primary, fontSize: 44.sp, fontWeight: FontWeight.bold),),
            Text('Smart Park', style: TextStyle(color: app_colors.primary, fontSize: 24.sp))
          ],
        ),
        Row(
          children: [
            const Icon(Icons.search, color: app_colors.primary,),
            Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: const Icon(Icons.add, color: app_colors.primary,))
          ],
        )
      ],
    ),
  );

  Widget _topMenu()=> Container(
    margin: EdgeInsets.only(top: 50.h),
    padding: EdgeInsets.symmetric(horizontal: 30.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _topMenuItem('icon_scan.png', 'Scan',),
        _topMenuItem('icon_credit_card.png', 'Card'),
        _topMenuItem('icon_coupon.png', 'Coupon'),
        _topMenuItem('icon_diamond.png', 'Privilege'),
      ],
    ),
  );

  Widget _bodyPage()=> Container(
    margin: EdgeInsets.only(top: 80.h),
    padding: EdgeInsets.symmetric(vertical: 50.h, horizontal: 30.w),
    decoration: BoxDecoration(
        color: app_colors.bg,
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 0.5,
              blurRadius: 20,
              offset: const Offset(0,0)
          )
        ]
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _bodyMenuItem('icon_home.png', 'My Home'),
            _bodyMenuItem('icon_online_booking.png', 'Online Booking'),
            _bodyMenuItem('icon_contact.png', 'Contact'),
          ],
        ),
        _announcementWidget(),
        _listAnnouncementWidget()
      ],
    ),
  );

  Widget _topMenuItem(image, title, {VoidCallback? action})=> GestureDetector(
    onTap: action,
    child: Column(
      children: [
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 0.5,
                  blurRadius: 4,
                  offset: const Offset(0,0)
              )
            ]
          ),
          padding: EdgeInsets.all(40.w),
          child: Image.asset('images/$image', color: app_colors.primary, width: 50.w, height: 50.w,),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20.h),
          child: Text(title, style: TextStyle(color: app_colors.primary, fontSize: 22.sp),))
      ],
    ),
  );

  Widget _bodyMenuItem(image, title, {VoidCallback? action})=> GestureDetector(
    onTap: action,
    child: Container(
      width: 225.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(35),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 0.5,
                blurRadius: 4,
                offset: const Offset(0,0)
            )
          ]
      ),
      padding: EdgeInsets.only(top: 100.h, bottom: 70.h),
      child: Column(
        children: [
          Image.asset('images/$image', color: app_colors.primary, width: 80.w, height: 80.w,),
          Padding(
            padding: EdgeInsets.only(top: 50.h),
              child: Text(title, style: TextStyle(color: app_colors.primary, fontSize: 22.sp)))
        ],
      ),
    ),
  );

  Widget _announcementWidget()=> Obx(()=> controller.viewState.value == ViewState.LOADING
      ? Container()
      : Padding(
    padding: EdgeInsets.only(top: 70.h),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset('images/icon_announcement.png', color: app_colors.primary, width: 50.w, height: 50.w,),
        Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Announcement', style: TextStyle(color: app_colors.primary, fontSize: 32.sp, fontWeight: FontWeight.w400),),
              for(int i = 0; i < controller.getFeedAnnouncementObservable.value!.listHeadAnnouncement.length; i++)
                Text('● ${controller.getFeedAnnouncementObservable.value!.listHeadAnnouncement[i]}', style: TextStyle(color: app_colors.primary, fontSize: 28.sp, fontWeight: FontWeight.w400))
            ],
          ),
        )
      ],
    ),
  )
  );

  Widget _listAnnouncementWidget()=> Obx(()=> controller.viewState.value == ViewState.LOADING
      ? Container()
      : Column(
          children: [
            for(int i = 0; i < controller.getFeedAnnouncementObservable.value!.listItemAnnouncementEntity.length; i++)
              ItemAnnouncementWidget(itemAnnouncementEntity: controller.getFeedAnnouncementObservable.value!.listItemAnnouncementEntity[i])
          ],
        )
  );
}
