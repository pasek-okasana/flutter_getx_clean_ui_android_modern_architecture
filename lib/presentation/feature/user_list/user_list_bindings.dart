import 'package:get/get.dart';

import '../../../data/repository_implement/user_repo_impl.dart';
import '../../../domain/usecase/user_list_use_case.dart';
import 'user_list_controller.dart';

class UserListBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserListUseCase(repo: Get.find<UserRepoImpl>()));
    Get.put(UserListController(Get.find()));
  }
}
