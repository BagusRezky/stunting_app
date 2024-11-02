import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stunting_app/features/artikel/controllers/artikel_controller.dart';
import 'package:stunting_app/features/artikel/view/components/artikel_card.dart';
import 'package:stunting_app/shared/styles/color_style.dart';
import 'package:stunting_app/shared/styles/google_text_style.dart';

class ArtikelScreen extends StatelessWidget {
  const ArtikelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final artikelController = Get.put(ArtikelController());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: artikelController.back,
        ),
        title: const Text('Artikel Edukasi'),
        titleTextStyle: GoogleTextStyle.fw600
            .copyWith(color: ColorStyle.dark, fontSize: 17.sp),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/artikelimage.png',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(20.h),
            child: Text(
              'Rekomendasi Artikel',
              style: GoogleTextStyle.fw600
                  .copyWith(color: ColorStyle.dark, fontSize: 17.sp),
            ),
          ),
          Expanded(
            child: Obx(() {
              if (artikelController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              return ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                itemCount: artikelController.artikelList.length,
                itemBuilder: (context, index) {
                  final artikel = artikelController.artikelList[index];
                  return ArtikelCard(
                    artikel: artikel,
                    onTap: () => artikelController.openDetail(artikel),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
