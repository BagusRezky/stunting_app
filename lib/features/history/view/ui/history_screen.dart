import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stunting_app/features/history/controllers/history_controller.dart';
import 'package:stunting_app/features/history/view/ui/informasi/informasi.dart';
import 'package:stunting_app/features/history/view/ui/riwayat/riwayat.dart';
import 'package:stunting_app/features/splash/constants/splash_assets_constant.dart';
import 'package:stunting_app/shared/styles/color_style.dart';
import 'package:stunting_app/shared/styles/google_text_style.dart';
import 'package:stunting_app/shared/widgets/custom_button.dart';

class HistoryScreen extends StatelessWidget {
  HistoryScreen({super.key});
  final assetsConstant = SplashAssetsConstant();
  @override
  Widget build(BuildContext context) {
    Get.put(
        HistoryController()); // Get.put digunakan untuk inisialisasi controller
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: ColorStyle.white,
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Get.back();
              },
            ),
            backgroundColor: ColorStyle.white,
            centerTitle: true,
            title: const Text('History'),
            titleTextStyle: GoogleTextStyle.fw600
                .copyWith(color: ColorStyle.dark, fontSize: 17.sp),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  height: 130.h,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/backgroundhistory.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/children.png',
                        width: 70.w,
                        height: 70.h,
                      ),
                      SizedBox(width: 25.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Hi, Ryan',
                              style: GoogleTextStyle.fw700.copyWith(
                                  color: ColorStyle.white, fontSize: 18.sp)),
                          Text(
                            '15 bulan',
                            style: GoogleTextStyle.fw400.copyWith(
                                color: ColorStyle.white, fontSize: 14.sp),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(
                      16.0), // optional: padding untuk container

                  child: Column(
                    children: [
                      // TabBar dalam body
                      const TabBar(
                        labelColor: Colors.blue, // warna text saat tab dipilih
                        unselectedLabelColor:
                            Colors.grey, // warna text saat tab tidak dipilih
                        indicatorColor:
                            Colors.blue, // warna garis indikator di bawah tab
                        tabs: [
                          Tab(text: 'Informasi'),
                          Tab(text: 'Riwayat'),
                        ],
                      ),
                      // Expanded untuk mengisi sisa ruang dengan TabBarView
                      SizedBox(
                        height: 500.h,
                        child: const TabBarView(
                          children: [InformasiPage(), RiwayatPage()],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomButton(
                    onPressed: () {
                      Get.find<HistoryController>().back();
                    },
                    text: 'Tambah Data',
                    backgroundColor: ColorStyle.primary,
                    textStyle: GoogleTextStyle.fw500.copyWith(
                      color: ColorStyle.white,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
