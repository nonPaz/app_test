import 'package:app_test/domain/entities/item_announcement_entity.dart';

class FeedAnnouncementEntity{
  final List<String> listHeadAnnouncement;
  final List<ItemAnnouncementEntity> listItemAnnouncementEntity;

  FeedAnnouncementEntity({required this.listHeadAnnouncement, required this.listItemAnnouncementEntity});
}