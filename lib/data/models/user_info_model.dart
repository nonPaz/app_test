import 'package:app_test/data/response/remote/user_info_response.dart';
import 'package:app_test/domain/entities/user_info_entity.dart';

class UserInfoModel extends UserInfoEntity{
  UserInfoModel({
    required String userName,
    required String imageProfile
  }) : super(userName: userName, imageProfile: imageProfile);

  factory UserInfoModel.fromResponse(UserInfoResponse itemResponse) => UserInfoModel(
      userName: itemResponse.userName!,
      imageProfile: itemResponse.imageProfile!
  );
}