import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'user_list_controller.dart';

class UserListPage extends GetView<UserListController> {
  const UserListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("List User"),
      ),
      body: GetX(
        init: controller,
        initState: (state) {
          controller.fechList();
        },
        builder: (_) {
          if (controller.isLoading.isTrue) {
            return const Center(child: CircularProgressIndicator());
          }
          var dataPaging = controller.paging.value!;
          if (dataPaging.isSuccess) {
            return ListView.builder(
              itemCount: controller.listDataUser.length,
              itemBuilder: (context, index) {
                final dataView = controller.listDataUser[index];
                return GestureDetector(
                  onTap: () {},
                  child: Card(
                    child: Text("${dataView.firstName}"),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: Text("${dataPaging.errorMessage}"),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.fechList(),
        tooltip: 'ADD',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
