import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stunting_app/features/profile/controllers/profile_controller.dart';
import 'package:stunting_app/features/profile/view/components/profile_info.dart';
import 'package:stunting_app/shared/styles/color_style.dart';
import 'package:stunting_app/shared/styles/google_text_style.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        titleTextStyle: GoogleTextStyle.fw600
            .copyWith(color: ColorStyle.dark, fontSize: 17.sp),
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
