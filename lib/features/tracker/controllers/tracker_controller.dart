import 'package:get/get.dart';
import 'package:stunting_app/configs/routes/route.dart';

class TrackerController extends GetxController {
  // Optional: Add observable variables here if you want to handle states (e.g., loading)

  void simpan() {
    // Perform any authentication logic here if needed
    // If login is successful, navigate to the home route
    Get.toNamed(Routes.historyRoute);
  }
}
