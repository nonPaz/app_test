import 'package:app_test/data/response/remote/feed_announcement_response.dart';
import 'package:app_test/domain/entities/feed_announcement_entitiy.dart';
import 'package:app_test/domain/entities/item_announcement_entity.dart';

class FeedAnnouncementModel extends FeedAnnouncementEntity{
  FeedAnnouncementModel({
    required List<String> listHeadAnnouncement,
    required List<ItemAnnouncementEntity> listItemAnnouncementEntity
  }) : super(listHeadAnnouncement: listHeadAnnouncement, listItemAnnouncementEntity: listItemAnnouncementEntity);

  factory FeedAnnouncementModel.fromResponse(FeedAnnouncementResponse itemResponse)=> FeedAnnouncementModel(
      listHeadAnnouncement: itemResponse.listHeadAnnouncement!,
      listItemAnnouncementEntity: itemResponse.listItemAnnouncementResponse!
  );
}