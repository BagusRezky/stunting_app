import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stunting_app/configs/routes/route.dart';
import 'package:stunting_app/shared/styles/color_style.dart';
import 'package:stunting_app/shared/styles/google_text_style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imagePaths = [
      'assets/images/artikel1.png',
      'assets/images/artikel1.png',
      'assets/images/artikel1.png',
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 80.h, left: 20.w, right: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/dashboard1.png'),
              SizedBox(height: 20.h),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Artikel Terbaru',
                        style: GoogleTextStyle.fw600
                            .copyWith(color: ColorStyle.dark, fontSize: 16.sp),
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.artikelRoute);
                        },
                        child: Text(
                          'Lainnya',
                          style: GoogleTextStyle.fw400.copyWith(
                              color: ColorStyle.primary, fontSize: 14.sp),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 220.h,
                      viewportFraction: 1.0,
                      enableInfiniteScroll: false,
                      autoPlay: false,
                    ),
                    items: [
                      for (int i = 0; i < imagePaths.length; i += 2)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (i < imagePaths.length)
                              Image.asset(
                                imagePaths[i],
                                width: 170.w,
                                height: 200.h,
                                // fit: BoxFit.cover,
                              ),
                            SizedBox(width: 25.w),
                            if (i + 1 < imagePaths.length)
                              Image.asset(
                                imagePaths[i + 1],
                                width: 170.w,
                                height: 200.h,
                                // fit: BoxFit.cover,
                              ),
                          ],
                        ),
                    ],
                  ),
                ],
              ),
              Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Video Terbaru',
                          style: GoogleTextStyle.fw600.copyWith(
                              color: ColorStyle.dark, fontSize: 16.sp),
                        ),
                        InkWell(
                          onTap: () {
                            Get.toNamed(Routes.videoRoute);
                          },
                          child: Text(
                            'Lainnya',
                            style: GoogleTextStyle.fw400.copyWith(
                                color: ColorStyle.primary, fontSize: 14.sp),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Image.asset('assets/images/video1.png'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
