// ignore_for_file: avoid_print

import 'package:app_test/core/result/app_result.dart';
import 'package:app_test/core/usecases/usecase.dart';
import 'package:app_test/core/view_state.dart';
import 'package:app_test/domain/entities/feed_announcement_entitiy.dart';
import 'package:app_test/domain/entities/user_info_entity.dart';
import 'package:app_test/domain/usecases/get_remote_announcement.dart';
import 'package:app_test/domain/usecases/get_remote_user_info.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{

  final GetRemoteUserInfo getRemoteUserInfo;
  final GetRemoteAnnouncement getRemoteAnnouncement;
  HomeController({required this.getRemoteUserInfo, required this.getRemoteAnnouncement});

  final viewState = ViewState.INITIAL.obs;

  final _userInfoObservable = Rxn<UserInfoEntity>();
  final _feedAnnouncementObservable = Rxn<FeedAnnouncementEntity>();

  Rxn<UserInfoEntity> get getUserInfoObservable => _userInfoObservable;
  Rxn<FeedAnnouncementEntity> get getFeedAnnouncementObservable => _feedAnnouncementObservable;

  @override
  void onInit() {
    getUserInfo();
    getFeedAnnouncement();
    super.onInit();
  }

  @override
  void onClose() {
    _userInfoObservable.close();
    _feedAnnouncementObservable.close();
    super.onClose();
  }

  void getUserInfo() async {
    viewState.value = ViewState.LOADING;
    AppResult<UserInfoEntity> appResult = await getRemoteUserInfo.call(NoParams());
    appResult.whenWithResult((result) {
      _userInfoObservable.value = result.value;
      print(_userInfoObservable);
      viewState.value = ViewState.SUCCESS;
    }, (error) => viewState.value = ViewState.ERROR);
  }

  void getFeedAnnouncement() async {
    viewState.value = ViewState.LOADING;
    AppResult<FeedAnnouncementEntity> appResult = await getRemoteAnnouncement.call(NoParams());
    appResult.whenWithResult((result) {
      _feedAnnouncementObservable.value = result.value;
      viewState.value = ViewState.SUCCESS;
    }, (error) => viewState.value = ViewState.ERROR);
  }
}