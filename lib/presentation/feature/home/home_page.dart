import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('HomePage'),
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () => Get.toNamed(Routes.USER_LIST),
                child: const Text("List User"),
              ),
              ElevatedButton(
                onPressed: () => Get.toNamed(Routes.USER_POST),
                child: const Text("Post User"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
