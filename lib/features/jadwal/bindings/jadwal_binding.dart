import 'package:get/get.dart';
import 'package:stunting_app/features/history/controllers/history_controller.dart';
import 'package:stunting_app/features/jadwal/controllers/jadwal_controller.dart';
import 'package:stunting_app/features/login/controllers/login_controller.dart';

class HistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JadwalController>(() => JadwalController());
  }
}
