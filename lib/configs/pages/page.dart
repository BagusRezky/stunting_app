import 'package:get/get.dart';
import 'package:stunting_app/configs/routes/route.dart';
import 'package:stunting_app/features/onboarding/bindings/onboarding_binding.dart';
import 'package:stunting_app/features/onboarding/view/ui/onboarding_screen.dart';
import 'package:stunting_app/features/splash/bindings/splash_binding.dart';
import 'package:stunting_app/features/splash/view/ui/splash_screen.dart';

abstract class Pages {
  static final pages = [
    GetPage(
      name: Routes.splashRoute,
      page: () => SplashScreen(),
      binding: SplashBinding()
    ),
    // Tambahkan halaman lain di sini
    GetPage(
        name: Routes.onboardRoute,
        page: () => OnboardingScreen(),
        binding: OnboardingBinding()
    ),
  ];
}
