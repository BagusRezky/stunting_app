import 'package:get/get.dart';
import 'package:stunting_app/features/onboarding/controllers/onboarding_controller.dart';

class OnboardingBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put(OnboardingController());
    Get.lazyPut<OnboardingController>(() => OnboardingController());
  }
}
