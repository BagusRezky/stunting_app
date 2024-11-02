import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stunting_app/features/artikel/controllers/artikel_controller.dart';
import 'package:stunting_app/shared/styles/color_style.dart';
import 'package:stunting_app/shared/styles/google_text_style.dart';

class ArtikelScreen extends StatelessWidget {
  const ArtikelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ArtikelController());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.find<ArtikelController>().back();
          },
        ),
        title: const Text(
          'Artikel Edukasi',
        ),
        titleTextStyle: GoogleTextStyle.fw600
            .copyWith(color: ColorStyle.dark, fontSize: 17.sp),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/artikelimage.png',
          ),
          SizedBox(height: 20.h),
          Text(
            textAlign: TextAlign.start,
            'Rekomendasi Artikel',
            style: GoogleTextStyle.fw600
                .copyWith(color: ColorStyle.dark, fontSize: 17.sp),
          ),
        ],
      )),
    );
  }
}
