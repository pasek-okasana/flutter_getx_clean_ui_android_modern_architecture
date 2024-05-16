import 'package:get/get.dart';

import '../../../data/repository_implement/user_repo_impl.dart';
import '../../../domain/usecase/user_post_use_case.dart';
import 'user_post_controller.dart';

class UserPostBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserPostUseCase(repo: Get.find<UserRepoImpl>()));
    Get.put(UserPostController(Get.find()));
  }
}
