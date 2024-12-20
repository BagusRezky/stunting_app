import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stunting_app/configs/routes/route.dart';
import 'package:stunting_app/features/splash/constants/splash_assets_constant.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final assetsConstant = SplashAssetsConstant();
  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 3), () {
        Get.offNamed(Routes.onboardRoute);
      });
    });
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/stuncare.png',
          width: 200.w,
          height: 200.h,
        ),
      ),
    );
  }
}
