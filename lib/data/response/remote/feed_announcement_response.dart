import 'package:app_test/data/response/base_response.dart';
import 'package:app_test/domain/entities/item_announcement_entity.dart';

class FeedAnnouncementResponse extends BaseResponse {
  List<String>? listHeadAnnouncement;
  List<ItemAnnouncementEntity>? listItemAnnouncementResponse;

  FeedAnnouncementResponse.fromJson(Map<String, dynamic> parsedJson) : super.fromJson(parsedJson){
    listHeadAnnouncement = [];
    for(String item in parsedJson['data']['list_head_announcement']){
      listHeadAnnouncement!.add(item);
    }

    listItemAnnouncementResponse = [];
    for(Map<String, dynamic> item in parsedJson['data']['list_announcement']){
      listItemAnnouncementResponse!.add(ItemAnnouncementEntity(
          imageURL: item['image_url'],
          title: item['title'],
          dateTime: item['date_time']
      ));
    }
  }

}