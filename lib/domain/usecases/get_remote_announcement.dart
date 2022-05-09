import 'package:app_test/core/result/app_result.dart';
import 'package:app_test/core/usecases/usecase.dart';
import 'package:app_test/domain/entities/feed_announcement_entitiy.dart';
import 'package:app_test/domain/repositories/home_repository.dart';

class GetRemoteAnnouncement implements UseCase<AppResult<FeedAnnouncementEntity>, NoParams>{

  final HomeRepository homeRepository;
  GetRemoteAnnouncement({required this.homeRepository});

  @override
  Future<AppResult<FeedAnnouncementEntity>> call(NoParams params) async {
    return homeRepository.getFeedAnnouncement();
  }

}