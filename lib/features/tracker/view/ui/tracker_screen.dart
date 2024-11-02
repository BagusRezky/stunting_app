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
    final trackerController = Get.put(TrackerController());

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
                Get.find<TrackerController>().openHistory();
              }),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Obx(() => DropdownButtonFormField<String>(
                    value: trackerController.selectedChild.value.isEmpty
                        ? null
                        : trackerController.selectedChild.value,
                    items: trackerController.childrenList
                        .map((child) => DropdownMenuItem<String>(
                              value: child['id'].toString(),
                              child: Text(child['name']),
                            ))
                        .toList(),
                    onChanged: (value) {
                      trackerController.selectedChild.value = value!;
                    },
                    decoration: InputDecoration(
                      labelText: 'Nama Anak',
                      labelStyle: GoogleTextStyle.fw600
                          .copyWith(color: ColorStyle.dark, fontSize: 14.sp),
                      border: const OutlineInputBorder(),
                    ),
                  )),
              SizedBox(height: 10.h),
              // Tambahkan dropdown untuk gender
              Obx(() => DropdownButtonFormField<String>(
                    value: trackerController.selectedGender.value.isEmpty
                        ? null
                        : trackerController.selectedGender.value,
                    items: trackerController.genderOptions
                        .map((gender) => DropdownMenuItem<String>(
                              value: gender['value'],
                              child: Text(gender['label']),
                            ))
                        .toList(),
                    onChanged: (value) {
                      trackerController.selectedGender.value = value!;
                    },
                    decoration: InputDecoration(
                      labelText: 'Jenis Kelamin',
                      labelStyle: GoogleTextStyle.fw600
                          .copyWith(color: ColorStyle.dark, fontSize: 14.sp),
                      border: const OutlineInputBorder(),
                    ),
                  )),
              SizedBox(height: 10.h),
              CustomFieldContainer(
                label: Text('Umur Sekarang (bulan)',
                    style: GoogleTextStyle.fw600
                        .copyWith(color: ColorStyle.dark, fontSize: 14.sp)),
                child: TextField(
                  controller: trackerController.ageController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Masukkan umur dalam bulan",
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
                  controller: trackerController.weightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Masukkan berat dalam kg",
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
                  controller: trackerController.heightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Masukkan panjang dalam cm",
                    hintStyle: GoogleTextStyle.fw200
                        .copyWith(color: ColorStyle.dark, fontSize: 14.sp),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              CustomButton(
                onPressed: trackerController.simpan,
                text: 'Simpan',
                backgroundColor: ColorStyle.primary,
                textStyle: GoogleTextStyle.fw500.copyWith(
                  color: ColorStyle.white,
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
