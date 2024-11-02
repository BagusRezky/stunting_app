import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stunting_app/features/splash/constants/splash_assets_constant.dart';
import 'package:stunting_app/features/tracker/controllers/tracker_controller.dart';
import 'package:stunting_app/shared/styles/color_style.dart';
import 'package:stunting_app/shared/styles/google_text_style.dart';
import 'package:stunting_app/shared/widgets/custom_button.dart';
import 'package:stunting_app/shared/widgets/custom_fields.dart';

class TrackerScreen extends StatelessWidget {
  TrackerScreen({super.key});
  final assetsConstant = SplashAssetsConstant();

  @override
  Widget build(BuildContext context) {
    Get.put(TrackerController());
    return Scaffold(
        backgroundColor: ColorStyle.white,
        appBar: AppBar(
          backgroundColor: ColorStyle.white,
          centerTitle: true,
          title: const Text('Pelacak Stunting'),
          titleTextStyle: GoogleTextStyle.fw600
              .copyWith(color: ColorStyle.dark, fontSize: 17.sp),
          actions: [
            IconButton(
              icon: const Icon(Icons.history),
              onPressed: () {
                Get.find<TrackerController>().simpan();
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                CustomFieldContainer(
                  label: Text('Nama Lengkap',
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
                  label: Text('Umur Sekarang (bulan)',
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
                  label: Text('Berat Badan (kg)',
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
                  label: Text('Panjang Badan (cm)',
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
                SizedBox(height: 20.h),
                CustomButton(
                  onPressed: () {
                    Get.find<TrackerController>().simpan();
                  },
                  text: 'Simpan',
                  // height: 50.h,
                  // width: double.infinity,
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
