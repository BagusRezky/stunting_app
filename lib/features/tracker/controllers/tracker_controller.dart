import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stunting_app/configs/routes/route.dart';
import 'package:http/http.dart' as http;

// tracker_controller.dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stunting_app/features/history/view/ui/history_screen.dart';

class TrackerController extends GetxController {
  final TextEditingController ageController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final RxString selectedChild = ''.obs;
  final RxString selectedGender = ''.obs; 
  final RxList<dynamic> childrenList = <dynamic>[].obs;

  String? token;
  Map<String, dynamic>? userData;

  @override
  void onInit() {
    super.onInit();
    loadUserData();
  }

  Future<void> loadUserData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      token = prefs.getString('token');

      if (token != null) {
        final parts = token!.split('.');
        if (parts.length > 1) {
          final payload = json.decode(
              utf8.decode(base64Url.decode(base64Url.normalize(parts[1]))));
          userData = payload;
        }

        await fetchChildren();
      } else {
        Get.snackbar('Error', 'Sesi tidak valid. Silakan login kembali.');
        Get.offNamed('/login');
      }
    } catch (e) {
      print('Load user data error: $e');
      Get.snackbar('Error', 'Gagal memuat data pengguna');
    }
  }

  Future<void> fetchChildren() async {
    if (token == null || userData == null) {
      Get.snackbar('Error', 'Sesi tidak valid');
      return;
    }

    try {
      final userId = userData!['sub'];
      final response = await http.get(
        Uri.parse(
            'https://e976-114-6-25-184.ngrok-free.app/api/child-growth-monitoring/$userId/children'),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final decodedResponse = jsonDecode(response.body);
        print('Children response: $decodedResponse'); // Untuk debugging

        // Ambil array children dari response.data
        if (decodedResponse['status'] == 'success' &&
            decodedResponse['data'] != null) {
          childrenList.value = decodedResponse['data'];
          print(
              'Processed children list: ${childrenList.value}'); // Untuk debugging
        } else {
          print('Invalid response structure: $decodedResponse');
          Get.snackbar('Error', 'Format data tidak valid');
        }
      } else {
        print('Fetch children error: ${response.body}');
        Get.snackbar('Error', 'Gagal mengambil data anak');
      }
    } catch (e) {
      print('Fetch children error: $e');
      Get.snackbar('Error', 'Terjadi kesalahan saat mengambil data anak');
    }
  }

  final List<Map<String, dynamic>> genderOptions = [
    {'value': '0', 'label': 'Laki-laki'},
    {'value': '1', 'label': 'Perempuan'},
  ];

  Future<void> simpan() async {
    if (token == null) {
      Get.snackbar('Error', 'Sesi tidak valid');
      return;
    }

    if (selectedChild.isEmpty ||
        ageController.text.isEmpty ||
        weightController.text.isEmpty ||
        heightController.text.isEmpty ||
        selectedGender.isEmpty) {
      // Tambahkan validasi gender
      Get.snackbar('Error', 'Semua field harus diisi');
      return;
    }

    try {
      final response = await http.post(
        Uri.parse(
            'https://e976-114-6-25-184.ngrok-free.app/api/child-growth-monitoring/store'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          "child_id": int.parse(selectedChild.value),
          "height": double.parse(heightController.text),
          "weight": double.parse(weightController.text),
          "age": int.parse(ageController.text),
          "gender": selectedGender.value, // Tambahkan gender ke request
          "service_date": DateTime.now().toIso8601String().substring(0, 10),
        }),
      );

      print('Response body: ${response.body}'); // Untuk debugging

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        if (responseData['status'] == 'success') {
          Get.snackbar('Sukses', 'Data berhasil disimpan');
          clearForm();
          await fetchChildren();
          Get.toNamed(Routes.historyRoute);
        } else {
          Get.snackbar('Error',
              responseData['message']?.toString() ?? 'Gagal menyimpan data');
        }
      } else {
        print('Save error: ${response.body}');
        Get.snackbar('Error', 'Gagal menyimpan data');
      }
    } catch (e) {
      print('Save error: $e');
      Get.snackbar('Error', 'Terjadi kesalahan saat menyimpan data');
    }
  }

  void openHistory() {
    Get.toNamed(Routes.historyRoute);
  }
   void clearForm() {
    ageController.clear();
    weightController.clear();
    heightController.clear();
    selectedChild.value = '';
    selectedGender.value = ''; // Reset gender juga
  }

  @override
  void onClose() {
    ageController.dispose();
    weightController.dispose();
    heightController.dispose();
    super.onClose();
  }
}
