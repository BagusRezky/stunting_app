import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stunting_app/features/onboarding/controllers/onboarding_controller.dart';
import 'package:stunting_app/features/onboarding/view/components/onboarding_content.dart';
import 'package:stunting_app/shared/styles/color_style.dart';
import 'package:stunting_app/shared/widgets/custom_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final onboardingController = Get.find<OnboardingController>();

    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: onboardingController.pageController,
            onPageChanged: onboardingController.onPageChanged,
            itemCount: 4,
            itemBuilder: (context, index) {
              return OnboardingContent(index: index);
            },
          ),
          Positioned(
            bottom: 40.h,
            left: 16.w,
            right: 16.w,
            child: Column(
              children: [
                Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        4,
                        (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          height: 8.h,
                          width: onboardingController.currentPage.value == index
                              ? 24.w
                              : 8.w,
                          decoration: BoxDecoration(
                            color:
                                onboardingController.currentPage.value == index
                                    ? ColorStyle.primary
                                    : ColorStyle.disable,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    )),
                SizedBox(height: 20.h),
                Obx(() => CustomButton(
                      onPressed: onboardingController.nextPage,
                      text: onboardingController.currentPage.value == 3
                          ? "Ayo Mulai"
                          : "Selanjutnya",
                      // width: double.infinity,
                      // height: 50.h,
                      // backgroundColor: Colors.green,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
