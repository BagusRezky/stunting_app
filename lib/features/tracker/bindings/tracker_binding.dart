import 'package:get/get.dart';
import 'package:stunting_app/features/login/controllers/login_controller.dart';

class TrackerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
