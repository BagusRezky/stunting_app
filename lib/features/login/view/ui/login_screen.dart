import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stunting_app/features/login/controllers/login_controller.dart';
import 'package:stunting_app/shared/styles/color_style.dart';
import 'package:stunting_app/shared/styles/google_text_style.dart';
import 'package:stunting_app/shared/widgets/custom_button.dart';
import 'package:stunting_app/shared/widgets/custom_fields.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final LoginController _loginController = Get.put(LoginController());

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
                        style: GoogleTextStyle.fw700
                            .copyWith(color: ColorStyle.dark, fontSize: 18.sp)),
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
                controller: _loginController.emailController,
                decoration: InputDecoration(
                  hintText: "Masukkan email",
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
                controller: _loginController.passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Masukkan password",
                  hintStyle: GoogleTextStyle.fw200
                      .copyWith(color: ColorStyle.dark, fontSize: 14.sp),
                  border: InputBorder.none,
                ),
              ),
            ),
            Obx(() => CustomButton(
                  onPressed: () async {
                    await _loginController.login();
                  },
                  text:
                      _loginController.isLoading.value ? 'Loading...' : 'Masuk',
                  backgroundColor: ColorStyle.primary,
                  textStyle: GoogleTextStyle.fw500.copyWith(
                    color: ColorStyle.white,
                    fontSize: 16.sp,
                  ),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Belum memiliki akun?',
                  style: GoogleTextStyle.fw400
                      .copyWith(color: ColorStyle.dark, fontSize: 14.sp),
                  textAlign: TextAlign.center,
                ),
                InkWell(
                  onTap: () {
                    // _loginController.;
                  },
                  child: Text(
                    'Register',
                    style: GoogleTextStyle.fw400
                        .copyWith(color: ColorStyle.primary, fontSize: 14.sp),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
