import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stunting_app/configs/routes/route.dart';
import 'package:stunting_app/features/login/constants/login_api_constant.dart';

class LoginController extends GetxController {
  // Optional: Add observable variables here if you want to handle states (e.g., loading)
  final LoginApiConstant _authService = LoginApiConstant();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Email dan password wajib diisi',
          snackPosition: SnackPosition.TOP);
      return;
    }

    try {
      final response = await _authService.login(email, password);
      if (response.status == "success" && response.token != null) {
        // Simpan token atau arahkan pengguna ke halaman berikutnya
        Get.snackbar('Success', 'Login berhasil, token disimpan',
            snackPosition: SnackPosition.TOP);
        Get.offNamed(Routes.mainRoute);
        // Simpan token di SharedPreferences atau local storage
        // e.g., await LocalStorage.saveToken(response.token);
      } else {
        Get.snackbar('Error', response.message ?? 'Login gagal',
            snackPosition: SnackPosition.TOP);
      }
    } catch (e) {
      Get.snackbar('Error', 'Terjadi kesalahan saat login',
          snackPosition: SnackPosition.TOP);
    }
  }

  // void login() {
  //   // Perform any authentication logic here if needed
  //   // If login is successful, navigate to the home route
  //   Get.offNamed(Routes.mainRoute);
  // }
  void register() {
    // Perform any authentication logic here if needed
    // If login is successful, navigate to the home route
    Get.offNamed(Routes.registerRoute);
  }
}
