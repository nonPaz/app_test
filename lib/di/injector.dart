// ignore_for_file: avoid_print

import 'package:app_test/config/flavor_config.dart';
import 'package:app_test/data/datasources/remote/home_remote.dart';
import 'package:app_test/data/datasources/remote/remote_datasource.dart';
import 'package:app_test/data/repositories/home_repository_impl.dart';
import 'package:app_test/domain/repositories/home_repository.dart';
import 'package:app_test/domain/usecases/get_remote_announcement.dart';
import 'package:app_test/domain/usecases/get_remote_user_info.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class Injector {

  Injector._constructor();
  static Injector get instance => Injector._constructor();

  void dependencies() {
    _registerNetworkDependency();
    _registerRepositories();
    _registerDataSources();
    _registerUseCases();
  }

  _registerNetworkDependency() async {
    try{
      Get.lazyPut<Dio>(() => _getNetworkFramework(FlavorConfig.instance!.values.baseURLAPI));
    }catch(e){
      print(e);
    }
  }

  _registerRepositories(){
    try{
      Get.lazyPut<HomeRepository>(() => HomeRepositoryImpl(remoteDataSource: Get.find<RemoteDataSource>()), fenix: true);
    }catch(e){
      print(e);
    }
  }

  _registerDataSources(){
    try{
      Get.lazyPut<RemoteDataSource>(() => HomeRemote(dio: Get.put(Dio())), fenix: true);
    }catch(e){
      print(e);
    }
  }

  _registerUseCases(){
    try{
      Get.lazyPut<GetRemoteUserInfo>(() => GetRemoteUserInfo(homeRepository: Get.find<HomeRepository>()), fenix: true);
      Get.lazyPut<GetRemoteAnnouncement>(() => GetRemoteAnnouncement(homeRepository: Get.find<HomeRepository>()), fenix: true);
    }catch(e){
      print(e);
    }
  }

  Dio _getNetworkFramework(String? baseURL){
    Dio dio = Dio();
    dio.options = BaseOptions(
        baseUrl: baseURL!,
        connectTimeout: 60000,
        receiveTimeout: 60000
    );

    if(kDebugMode){
      dio.interceptors.add(
          LogInterceptor(responseBody: true, requestBody: true)
      );
    }

    return dio;
  }
}