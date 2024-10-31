import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stunting_app/features/onboarding/constants/onboarding_assets_constant.dart';
import 'package:stunting_app/shared/styles/color_style.dart';
import 'package:stunting_app/shared/styles/google_text_style.dart';

class OnboardingContent extends StatelessWidget {
  final int index;
  const OnboardingContent({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final data = OnboardingAssetsConstant.onboardingData[index];

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(data["image"]!),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: 24.w,
          right: 24.w,
          top: 320.h,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data["title"]!,
              style: GoogleTextStyle.fw800.copyWith(
                color: ColorStyle.white,
                fontSize: 24.sp,
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              data["description"]!,
              style: GoogleTextStyle.fw200.copyWith(
                color: ColorStyle.white,
                fontSize: 20.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
