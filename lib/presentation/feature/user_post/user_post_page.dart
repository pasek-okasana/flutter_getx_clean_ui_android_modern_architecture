import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../widget_component/custom_text_field.dart';
import './user_post_controller.dart';

class UserPostPage extends GetView<UserPostController> {
  const UserPostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('User Post Page'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CustomTextField(
                title: "Name",
                hintText: "",
                controller: controller.textControllerName,
              ),
              CustomTextField(
                title: "Job",
                hintText: "",
                controller: controller.textControllerJob,
              ),
              ElevatedButton(
                onPressed: () => controller.submitData(),
                child: const Text("Submit"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
