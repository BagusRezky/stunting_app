import 'package:get/get.dart';
import 'package:stunting_app/features/register/controllers/register_controller.dart';
import 'package:stunting_app/features/saran_makan/controllers/saran_controller.dart';

class SaranMakanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SaranController>(() => SaranController());
  }
}
