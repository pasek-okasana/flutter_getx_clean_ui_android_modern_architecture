import '../../core/datasource/result.dart';
import '../entities/body/user_post_body.dart';
import '../entities/user/list_user_entity.dart';

abstract class UserRepository {
  Future<Result<ListUserEntity>> fetchListUser(int page);
  Future<Result<bool>> postUser(UserPostBody body);
}
