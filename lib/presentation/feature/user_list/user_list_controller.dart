import 'package:get/get.dart';

import '../../../core/datasource/result.dart';
import '../../../domain/entities/user/list_user_entity.dart';
import '../../../domain/entities/user/list_user_sub_data_entity.dart';
import '../../../domain/usecase/user_list_use_case.dart';

class UserListController extends GetxController {
  UserListController(
    this._useCaseList,
  );

  final UserListUseCase _useCaseList;
  int _currentPage = 1;
  RxBool isLoading = false.obs;
  var paging = Rx<Result<ListUserEntity>?>(null);
  RxList<ListUserSubDataEntity> listDataUser = <ListUserSubDataEntity>[].obs;

  Future<void> fechList() async {
    isLoading(true);
    final result = await _useCaseList.execute(_currentPage);
    paging.value = result;
    var userData = result.resultValue?.userdata;
    if (userData!.isNotEmpty) {
      listDataUser.addAll(userData);
    } else {
      Get.snackbar("Informasi", "Ini Merupakan Data Terakhir");
    }
    _currentPage++;
    isLoading(false);
  }
}
