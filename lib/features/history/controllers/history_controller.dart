import 'package:get/get.dart';

class HistoryController extends GetxController {
  // Optional: Add observable variables here if you want to handle states (e.g., loading)

  void back() {
    // Perform any authentication logic here if needed
    // If login is successful, navigate to the home route
    Get.back();
  }
}
