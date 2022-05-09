import 'package:app_test/data/response/base_response.dart';

class UserInfoResponse extends BaseResponse{
  String? userName;
  String? imageProfile;

  UserInfoResponse.formJson(Map<String, dynamic> parsedJson) : super.fromJson(parsedJson) {
    Map<String, dynamic> data = parsedJson['data'];
      userName = data['user_name'];
      imageProfile = data['image_profile'];
  }
}