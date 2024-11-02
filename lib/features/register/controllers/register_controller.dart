import 'package:get/get.dart';
import 'package:stunting_app/configs/routes/route.dart';

class RegisterController extends GetxController {
  // Optional: Add observable variables here if you want to handle states (e.g., loading)

  void back() {
    // Perform any authentication logic here if needed
    // If login is successful, navigate to the home route
    Get.offNamed(Routes.mainRoute);
  }
  void login() {
    // Perform any authentication logic here if needed
    // If login is successful, navigate to the home route
    Get.offNamed(Routes.loginRoute);
  }
}
