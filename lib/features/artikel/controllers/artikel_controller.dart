import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:stunting_app/configs/routes/route.dart';
import 'package:stunting_app/features/artikel/view/ui/artikel_detail.dart';
import 'package:stunting_app/features/profile/models/user_model.dart';

class ArtikelController extends GetxController {
  final RxList<dynamic> artikelList = <dynamic>[].obs;
  final RxBool isLoading = true.obs;
  String? token;

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
        await fetchArtikels();
      }
    } catch (e) {
      print('Load user data error: $e');
    }
  }

  Future<void> fetchArtikels() async {
    try {
      final response = await http.get(
        Uri.parse('https://e976-114-6-25-184.ngrok-free.app/api/articles'),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final decodedResponse = jsonDecode(response.body);
        if (decodedResponse['status'] == 'success' &&
            decodedResponse['data'] != null) {
          artikelList.value = decodedResponse['data'];
        }
      }
    } catch (e) {
      print('Fetch articles error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void back() {
    Get.back();
  }

  void openDetail(Map<String, dynamic> artikel) {
    Get.to(() => ArtikelDetailScreen(artikel: artikel));
  }
}
