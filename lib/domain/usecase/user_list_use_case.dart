import '../../core/datasource/result.dart';
import '../../core/usecase/usecase.dart';
import '../entities/user/list_user_entity.dart';
import '../repository/user_repository.dart';

class UserListUseCase implements UseCase<Result<ListUserEntity>, int> {
  UserListUseCase({
    required this.repo,
  });
  final UserRepository repo;

  @override
  Future<Result<ListUserEntity>> execute(int params) {
    return repo.fetchListUser(params);
  }
}
