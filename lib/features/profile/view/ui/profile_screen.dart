import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stunting_app/features/profile/controllers/profile_controller.dart';
import 'package:stunting_app/features/profile/view/components/profile_info.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: Obx(() {
          final user = ProfileController().user.value;
          return ProfileInfo(
            name: user.name,
            email: user.email,
            age: user.age,
          );
        }),
      ),
    );
  }
}
