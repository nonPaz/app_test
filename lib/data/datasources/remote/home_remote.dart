import 'dart:convert';

import 'package:app_test/core/result/app_event_result.dart';
import 'package:app_test/core/result/app_result.dart';
import 'package:app_test/data/datasources/remote/remote_datasource.dart';
import 'package:app_test/data/models/feed_announcement_model.dart';
import 'package:app_test/data/models/user_info_model.dart';
import 'package:app_test/data/response/remote/feed_announcement_response.dart';
import 'package:app_test/data/response/remote/user_info_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

class HomeRemote implements RemoteDataSource{

  final Dio dio;
  HomeRemote({required this.dio});

  @override
  Future<AppResult<UserInfoModel>> getUserInfo() async {
    try{
      final String dataMock = await rootBundle.loadString('resources/mock_data/user_info_profile_mock_data.json');
      Map<String, dynamic> dataMockDecode = json.decode(dataMock);

      UserInfoResponse response = UserInfoResponse.formJson(dataMockDecode);

      UserInfoModel? result;
      if(response.resultCode == AppResponseStatus.SUCCESS){
        result = UserInfoModel.fromResponse(response);
      }

      return Success(value: result!);
    }on DioError catch(e){
      return Error(exception: e);
    }
  }

  @override
  Future<AppResult<FeedAnnouncementModel>> getFeedAnnouncement() async {
    try{
      final String dataMock = await rootBundle.loadString('resources/mock_data/announcement_mock_data.json');
      Map<String, dynamic> dataMockDecode = json.decode(dataMock);

      FeedAnnouncementResponse response = FeedAnnouncementResponse.fromJson(dataMockDecode);

      FeedAnnouncementModel? result;
      if(response.resultCode == AppResponseStatus.SUCCESS){
        result = FeedAnnouncementModel.fromResponse(response);
      }

      return Success(value: result!);
    }on DioError catch(e){
      return Error(exception: e);
    }
  }
}