import 'package:app_test/core/result/app_result.dart';
import 'package:app_test/domain/entities/feed_announcement_entitiy.dart';
import 'package:app_test/domain/entities/user_info_entity.dart';

abstract class HomeRepository{
  Future<AppResult<UserInfoEntity>> getUserInfo();
  Future<AppResult<FeedAnnouncementEntity>> getFeedAnnouncement();
}