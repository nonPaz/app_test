import 'package:app_test/presentation/views/dashboard/discovery/discovery_page.dart';
import 'package:app_test/presentation/views/dashboard/home/home_page.dart';
import 'package:app_test/presentation/views/dashboard/message/message_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app_test/config/app_colors.dart' as app_colors;

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({Key? key}) : super(key: key);

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> with TickerProviderStateMixin {

  TabController? _tabController;

  final List<Widget> _tabMenuView = [];

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
    _setTabMenu();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: app_colors.bg,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 10)
            )
          ]
        ),
        child: TabBar(
            controller: _tabController,
            labelPadding: EdgeInsets.only(bottom: 20.h, top: 20.h),
            tabs: [
              Tab(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('images/icon_home.png', color: app_colors.primary, width: 45.w, height: 45.w),
                    Flexible(
                      child: Text('Home',
                        style: TextStyle(
                            color: app_colors.primary,
                            fontWeight: FontWeight.w400,
                            fontSize: 28.sp),
                      ),
                    )
                  ],
                ),
              ),
              Tab(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('images/icon_message.png', color: app_colors.primary, width: 45.w, height: 45.w),
                    Flexible(
                      child: Text('Message',
                        style: TextStyle(
                            color: app_colors.primary,
                            fontWeight: FontWeight.w400,
                            fontSize: 28.sp),
                      ),
                    )
                  ],
                ),
              ),
              Tab(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('images/icon_discovery.png', color: app_colors.primary, width: 45.w, height: 45.w),
                    Flexible(
                      child: Text('Discover',
                        style: TextStyle(
                            color: app_colors.primary,
                            fontWeight: FontWeight.w400,
                            fontSize: 28.sp),
                      ),
                    )
                  ],
                ),
              )
        ]),
      ),
      body: Stack(
        children: [
          TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              children: _tabMenuView,
              controller: _tabController,
          )
        ],
      ),
    );
  }

  _setTabMenu() {
    if(_tabMenuView.isEmpty){
      _tabMenuView.add(
        HomePage()
      );
      _tabMenuView.add(
        const MessagePage()
      );
      _tabMenuView.add(
        const DiscoveryPage()
      );
    }
  }
}
