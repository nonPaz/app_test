import 'package:app_test/core/result/app_result.dart';
import 'package:app_test/data/models/feed_announcement_model.dart';
import 'package:app_test/data/models/user_info_model.dart';

abstract class RemoteDataSource{
  Future<AppResult<UserInfoModel>> getUserInfo();
  Future<AppResult<FeedAnnouncementModel>> getFeedAnnouncement();
}