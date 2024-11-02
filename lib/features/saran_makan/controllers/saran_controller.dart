import 'dart:convert';

import 'package:get/get.dart';
import 'package:stunting_app/configs/routes/route.dart';
import 'package:stunting_app/features/saran_makan/constants/saran_api_contants.dart';
import 'package:stunting_app/features/saran_makan/models/saran_model.dart';

class SaranController extends GetxController {
  
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

  final SaranMakanService _service = SaranMakanService();
  RxInt budget = 0.obs;
  RxInt days = 0.obs;
  RxString result = ''.obs; // Variabel untuk menyimpan hasil respons API

  void setBudget(String value) {
    budget.value = int.tryParse(value) ?? 0;
  }

  void setDays(String value) {
    days.value = int.tryParse(value) ?? 0;
  }

  Future<void> generateSaranMakan() async {
    final request = SaranMakan(
      budget: budget.value,
      days: days.value,
    );
    final response = await _service.generateSaranMakan(request);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      result.value = data.toString(); // Mengisi hasil dengan respons dari API
    } else {
      result.value = 'Failed to generate recommendations';
    }
  }
}
