import 'package:app_test/domain/usecases/get_remote_announcement.dart';
import 'package:app_test/domain/usecases/get_remote_user_info.dart';
import 'package:app_test/presentation/views/dashboard/home/home_controller.dart';
import 'package:get/get.dart';

class DashBoardBinding extends Bindings{

  @override
  void dependencies() {
    Get.put<HomeController>(HomeController(
        getRemoteUserInfo: Get.find<GetRemoteUserInfo>(),
        getRemoteAnnouncement: Get.find<GetRemoteAnnouncement>()
    ));
  }

}