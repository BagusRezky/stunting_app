import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stunting_app/features/splash/constants/splash_assets_constant.dart';
import 'package:stunting_app/shared/styles/color_style.dart';
import 'package:stunting_app/shared/styles/google_text_style.dart';
import 'package:stunting_app/shared/widgets/custom_button.dart';
import 'package:stunting_app/shared/widgets/custom_fields.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final assetsConstant = SplashAssetsConstant();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorStyle.white,
        appBar: AppBar(
          backgroundColor: ColorStyle.white,
          centerTitle: true,
          title: const Text('Masuk'),
          titleTextStyle: GoogleTextStyle.fw600
              .copyWith(color: ColorStyle.dark, fontSize: 17.sp),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/images/LogoRegis.png',
                    width: 70.w,
                    height: 70.h,
                  ),
                  SizedBox(width: 25.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Selamat Datang di Stuncare',
                          style: GoogleTextStyle.fw700.copyWith(
                              color: ColorStyle.dark, fontSize: 18.sp)),
                      Text(
                        'Masuk dan nikmati fitur unggulan kami',
                        style: GoogleTextStyle.fw400
                            .copyWith(color: ColorStyle.dark, fontSize: 14.sp),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 40.h),
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
              CustomButton(
                onPressed: () {},
                text: 'Masuk',
                // height: 50.h,
                // width: double.infinity,
                backgroundColor: ColorStyle.primary,
                textStyle: GoogleTextStyle.fw500.copyWith(
                  color: ColorStyle.white,
                  fontSize: 16.sp,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Belum memiliki akun?',
                    style: GoogleTextStyle.fw400
                        .copyWith(color: ColorStyle.dark, fontSize: 14.sp),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Register',
                    style: GoogleTextStyle.fw400
                        .copyWith(color: ColorStyle.primary, fontSize: 14.sp),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
