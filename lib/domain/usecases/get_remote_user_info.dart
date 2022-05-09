import 'package:app_test/core/result/app_result.dart';
import 'package:app_test/core/usecases/usecase.dart';
import 'package:app_test/domain/entities/user_info_entity.dart';
import 'package:app_test/domain/repositories/home_repository.dart';

class GetRemoteUserInfo implements UseCase<AppResult<UserInfoEntity>, NoParams>{
  final HomeRepository homeRepository;
  GetRemoteUserInfo({required this.homeRepository});

  @override
  Future<AppResult<UserInfoEntity>> call(NoParams params) async {
    return homeRepository.getUserInfo();
  }
}