import 'package:get/get.dart';

import '../feature/home/home_bindings.dart';
import '../feature/home/home_page.dart';
import '../feature/user_list/user_list_bindings.dart';
import '../feature/user_list/user_list_page.dart';
import '../feature/user_post/user_post_bindings.dart';
import '../feature/user_post/user_post_page.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomePage(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: _Paths.USER_LIST,
      page: () => const UserListPage(),
      binding: UserListBindings(),
    ),
    GetPage(
      name: _Paths.USER_POST,
      page: () => const UserPostPage(),
      binding: UserPostBindings(),
    ),
    // GetPage(
    //   name: _Paths.,
    //   page: () => ,
    //   binding: ,
    // ),
  ];
}
