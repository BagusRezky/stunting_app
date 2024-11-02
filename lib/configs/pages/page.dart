import 'package:get/get.dart';
import 'package:stunting_app/configs/routes/route.dart';
import 'package:stunting_app/features/artikel/bindings/artikel_binding.dart';
import 'package:stunting_app/features/artikel/view/ui/artikel_screen.dart';
import 'package:stunting_app/features/history/bindings/tracker_binding.dart';
import 'package:stunting_app/features/history/view/ui/history_screen.dart';
import 'package:stunting_app/features/home/bindings/home_bindings.dart';
import 'package:stunting_app/features/home/view/ui/home.dart';
import 'package:stunting_app/features/login/bindings/login_binding.dart';
import 'package:stunting_app/features/login/view/ui/login_screen.dart';
import 'package:stunting_app/features/main/view/ui/main_page.dart';
import 'package:stunting_app/features/onboarding/bindings/onboarding_binding.dart';
import 'package:stunting_app/features/onboarding/view/ui/onboarding_screen.dart';
import 'package:stunting_app/features/profile/bindings/profile_binding.dart';
import 'package:stunting_app/features/profile/view/ui/profile_screen.dart';
import 'package:stunting_app/features/splash/bindings/splash_binding.dart';
import 'package:stunting_app/features/splash/view/ui/splash_screen.dart';
import 'package:stunting_app/features/tracker/bindings/tracker_binding.dart';
import 'package:stunting_app/features/tracker/view/ui/tracker_screen.dart';

abstract class Pages {
  static final pages = [
    GetPage(
        name: Routes.splashRoute,
        page: () => SplashScreen(),
        binding: SplashBinding()),
    // Tambahkan halaman lain di sini
    GetPage(
        name: Routes.onboardRoute,
        page: () => const OnboardingScreen(),
        binding: OnboardingBinding()),
    GetPage(
      name: Routes.loginRoute,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.mainRoute,
      page: () => MainScreen(),
    ),
    GetPage(
      name: Routes.homeRoute,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.profileRoute,
      page: () => ProfileScreen(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.historyRoute,
      page: () => HistoryScreen(),
      binding: HistoryBinding(),
    ),
    GetPage(
      name: Routes.trackerRoute,
      page: () => TrackerScreen(),
      binding: TrackerBinding(),
    ),
    GetPage(
      name: Routes.artikelRoute,
      page: () => ArtikelScreen(),
      binding: ArtikelBinding(),
    ),
  ];
}
