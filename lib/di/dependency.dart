import 'package:get/get.dart';

import '../data/repository_implement/user_repo_impl.dart';

class Dependency {
  static init() {
    Get.lazyPut(() => UserRepoImpl(), fenix: true);
  }
}
