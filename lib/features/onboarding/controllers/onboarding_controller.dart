import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stunting_app/configs/routes/route.dart';

// class OnboardingController extends GetxController {
//   static OnboardingController get to => Get.find();
// }

class OnboardingController extends GetxController {
  var currentPage = 0.obs;
  PageController pageController = PageController();

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

  // final PageController pageController = PageController();
  // final RxInt currentPage = 0.obs;

  void nextPage() {
    if (currentPage.value == 3) {
      Get.offNamed(Routes.loginRoute); // Sesuaikan rute login
    } else {
      pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    }
  }

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
