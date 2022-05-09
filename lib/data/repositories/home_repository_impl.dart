import 'package:app_test/core/result/app_result.dart';
import 'package:app_test/data/datasources/remote/remote_datasource.dart';
import 'package:app_test/domain/entities/feed_announcement_entitiy.dart';
import 'package:app_test/domain/entities/user_info_entity.dart';
import 'package:app_test/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository{

  final RemoteDataSource remoteDataSource;
  HomeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<AppResult<UserInfoEntity>> getUserInfo() async {
    final userInfoEntity = await remoteDataSource.getUserInfo();
    return userInfoEntity;
  }

  @override
  Future<AppResult<FeedAnnouncementEntity>> getFeedAnnouncement() async {
    final feedAnnouncementEntity = await remoteDataSource.getFeedAnnouncement();
    return feedAnnouncementEntity;
  }
}