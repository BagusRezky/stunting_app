import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stunting_app/features/jadwal/controllers/jadwal_controller.dart';
import 'package:stunting_app/features/splash/constants/splash_assets_constant.dart';
import 'package:stunting_app/shared/styles/color_style.dart';
import 'package:stunting_app/shared/styles/google_text_style.dart';
import 'package:stunting_app/shared/widgets/custom_button.dart';
import 'package:stunting_app/shared/widgets/custom_fields.dart';

class JadwalScreen extends StatelessWidget {
  JadwalScreen({super.key});
  final assetsConstant = SplashAssetsConstant();

  @override
  Widget build(BuildContext context) {
    Get.put(JadwalController());
    return Scaffold(
        backgroundColor: ColorStyle.white,
        appBar: AppBar(
          backgroundColor: ColorStyle.white,
          centerTitle: true,
          title: const Text('Jadwal Posyandu'),
          titleTextStyle: GoogleTextStyle.fw600
              .copyWith(color: ColorStyle.dark, fontSize: 17.sp),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                CustomFieldContainer(
                  label: Text('Email',
                      style: GoogleTextStyle.fw600
                          .copyWith(color: ColorStyle.dark, fontSize: 14.sp)),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Enter your text here",
                      hintStyle: GoogleTextStyle.fw200
                          .copyWith(color: ColorStyle.dark, fontSize: 14.sp),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                CustomFieldContainer(
                  label: Text('Password',
                      style: GoogleTextStyle.fw600
                          .copyWith(color: ColorStyle.dark, fontSize: 14.sp)),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Enter your text here",
                      hintStyle: GoogleTextStyle.fw200
                          .copyWith(color: ColorStyle.dark, fontSize: 14.sp),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                CustomFieldContainer(
                  label: Text('Tanggal Imunisasi',
                      style: GoogleTextStyle.fw600
                          .copyWith(color: ColorStyle.dark, fontSize: 14.sp)),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "dd/mm/yyyy",
                      hintStyle: GoogleTextStyle.fw200
                          .copyWith(color: ColorStyle.dark, fontSize: 14.sp),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                CustomButton(
                  onPressed: () {
                    // Get.find<LoginController>().login();
                  },
                  text: 'Tampilkan',
                  backgroundColor: ColorStyle.primary,
                  textStyle: GoogleTextStyle.fw500.copyWith(
                    color: ColorStyle.white,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
