import 'package:get/get.dart';
import 'package:stunting_app/features/artikel/controllers/artikel_controller.dart';
import 'package:stunting_app/features/profile/controllers/profile_controller.dart';
import 'package:stunting_app/features/video/controllers/video_controller.dart';

class VideoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VideoController>(() => VideoController());
  }
}
