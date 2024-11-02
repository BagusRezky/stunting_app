import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stunting_app/configs/routes/route.dart';
import 'configs/pages/page.dart';
import 'configs/themes/theme.dart';
import 'utils/services/sentry_services.dart';

void main() async {
  // // Pastikan Flutter binding diinisialisasi
  // WidgetsFlutterBinding.ensureInitialized();

  // // Pre-initialize SharedPreferences
  // await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /// Screen Util Init berdasarkan ukuran iphone xr
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'STUNTCARE',
          debugShowCheckedModeBanner: false,
          // initialBinding: , Jika memiliki global bindding
          initialRoute: Routes.splashRoute,
          theme: themeLight,
          defaultTransition: Transition.native,
          getPages: Pages.pages,
        );
      },
    );
  }
}
