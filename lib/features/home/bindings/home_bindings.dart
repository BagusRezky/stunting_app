import 'package:get/get.dart';
import 'package:stunting_app/shared/controllers/navigation_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigationController>(() => NavigationController());
  }
}