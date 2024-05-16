// ignore_for_file: constant_identifier_names

part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const USER_LIST = _Paths.USER_LIST;
  static const USER_POST = _Paths.USER_POST;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const USER_LIST = '/user-list';
  static const USER_POST = '/user-post';
}
