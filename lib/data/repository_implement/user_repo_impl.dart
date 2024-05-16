import 'dart:developer';

import '../../core/datasource/result.dart';
import '../../domain/entities/body/user_post_body.dart';
import '../../domain/entities/user/list_user_entity.dart';
import '../../domain/repository/user_repository.dart';
import '../datasource/network/user_api.dart';
import '../model/list_user/list_user_model.dart';

class UserRepoImpl implements UserRepository {
  final String tag = "On User Repo Impl";
  @override
  Future<Result<ListUserEntity>> fetchListUser(int page) async {
    try {
      var result = await UserApi.fetchList(page).request();
      log("$tag Fetch Data => Result is $result");
      return Result.success(ListUserModel.fromJson(result));
    } catch (e) {
      log("$tag Error Fetch Data => $e");
      return Result.failed(e.toString());
    }
  }

  @override
  Future<Result<bool>> postUser(UserPostBody body) async {
    try {
      var result = await UserApi.post(body).request();
      log("$tag Post =>  Result is $result");
      return const Result.success(true);
    } catch (e) {
      log("$tag Error Post => $e");
      return Result.failed(e.toString());
    }
  }
}
