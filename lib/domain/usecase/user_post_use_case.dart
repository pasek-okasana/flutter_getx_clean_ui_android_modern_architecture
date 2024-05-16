import '../../core/datasource/result.dart';
import '../../core/usecase/usecase.dart';
import '../entities/body/user_post_body.dart';
import '../repository/user_repository.dart';

class UserPostUseCase implements UseCase<Result<bool>, UserPostBody> {
  UserPostUseCase({
    required this.repo,
  });
  final UserRepository repo;

  @override
  Future<Result<bool>> execute(UserPostBody params) {
    return repo.postUser(params);
  }
}
