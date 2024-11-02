import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stunting_app/configs/routes/route.dart';
import 'package:stunting_app/features/login/constants/login_api_constant.dart';

// class LoginController extends GetxController {
//   // Optional: Add observable variables here if you want to handle states (e.g., loading)
//   final LoginApiConstant _authService = LoginApiConstant();
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();

//   void login() async {
//     final email = emailController.text.trim();
//     final password = passwordController.text.trim();

//     if (email.isEmpty || password.isEmpty) {
//       Get.snackbar('Error', 'Email dan password wajib diisi',
//           snackPosition: SnackPosition.TOP);
//       return;
//     }

//     try {
//       final response = await _authService.login(email, password);
//       if (response.status == "success" && response.token != null) {
//         // Simpan token atau arahkan pengguna ke halaman berikutnya
//         Get.snackbar('Success', 'Login berhasil, token disimpan',
//             snackPosition: SnackPosition.TOP);
//         Get.offNamed(Routes.mainRoute);
//         // Simpan token di SharedPreferences atau local storage
//         // e.g., await LocalStorage.saveToken(response.token);
//       } else {
//         Get.snackbar('Error', response.message ?? 'Login gagal',
//             snackPosition: SnackPosition.TOP);
//       }
//     } catch (e) {
//       Get.snackbar('Error', 'Terjadi kesalahan saat login',
//           snackPosition: SnackPosition.TOP);
//     }
//   }

//   // void login() {
//   //   // Perform any authentication logic here if needed
//   //   // If login is successful, navigate to the home route
//   //   Get.offNamed(Routes.mainRoute);
//   // }
//   void register() {
//     // Perform any authentication logic here if needed
//     // If login is successful, navigate to the home route
//     Get.offNamed(Routes.registerRoute);
//   }
// }

class LoginController extends GetxController {
  final LoginApiConstant _authService = LoginApiConstant();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final RxBool isLoading = false.obs;

  Future<bool> saveUserSession(
      String token, Map<String, dynamic>? userData) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      // Simpan token
      await prefs.setString('token', token);

      // Simpan data user jika ada
      if (userData != null) {
        await prefs.setString('user_name', userData['name'] ?? '');
        await prefs.setString('user_email', userData['email'] ?? '');
        await prefs.setString('user_role', userData['role'] ?? '');
      }

      return true;
    } catch (e) {
      print('SharedPreferences save error: $e');
      return false;
    }
  }

  Future<void> login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar(
        'Error',
        'Email dan password wajib diisi',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red[100],
      );
      return;
    }

    try {
      isLoading.value = true;
      final response = await _authService.login(email, password);

      if (response.status == "success" && response.token != null) {
        // Coba simpan sesi
        bool sessionSaved =
            await saveUserSession(response.token!, response.data);

        // Tampilkan pesan sesuai hasil penyimpanan sesi
        if (sessionSaved) {
          Get.snackbar(
            'Success',
            'Login berhasil',
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.green[100],
          );
        } else {
          Get.snackbar(
            'Warning',
            'Login berhasil tapi gagal menyimpan sesi. Anda mungkin perlu login kembali nanti.',
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.yellow[100],
            duration: const Duration(seconds: 5),
          );
        }

        // Tetap navigasi ke halaman utama
        await Future.delayed(const Duration(milliseconds: 500));
        Get.offNamed(Routes.mainRoute);
      } else {
        Get.snackbar(
          'Error',
          response.message ?? 'Login gagal: Response tidak valid',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red[100],
        );
      }
    } catch (e) {
      print('Login error: $e');
      Get.snackbar(
        'Error',
        'Terjadi kesalahan saat login. Silakan coba lagi.',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red[100],
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<String?> getToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString('token');
    } catch (e) {
      print('SharedPreferences get token error: $e');
      return null;
    }
  }

  Future<void> logout() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();
      Get.offAllNamed(Routes.loginRoute);
    } catch (e) {
      print('Logout error: $e');
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
