import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/entities/body/user_post_body.dart';
import '../../../domain/usecase/user_post_use_case.dart';

class UserPostController extends GetxController {
  UserPostController(this._postUseCase);
  final UserPostUseCase _postUseCase;
  // Inisialisasi Data
  RxBool isLoading = false.obs;
  // Text Editing Controller
  final TextEditingController textControllerName = TextEditingController();
  final TextEditingController textControllerJob = TextEditingController();

  Future<void> submitData() async {
    isLoading(true);
    UserPostBody body = UserPostBody(
      name: textControllerName.text,
      job: textControllerJob.text,
    );
    var result = await _postUseCase.execute(body);
    if (result.isSuccess) {
      textControllerName.clear();
      textControllerJob.clear();
      Get.snackbar("Success", "Data Telah dibuat");
    } else {
      Get.snackbar("Error", result.errorMessage!);
    }

    isLoading(false);
  }
}
