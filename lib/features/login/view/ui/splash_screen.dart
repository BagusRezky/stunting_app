import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stunting_app/features/splash/constants/splash_assets_constant.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final assetsConstant = SplashAssetsConstant();
  @override
  Widget build(BuildContext context) {
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
