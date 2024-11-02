import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
class HistoryController extends GetxController {
  final RxString selectedChild = ''.obs;
  final RxList<dynamic> childrenList = <dynamic>[].obs;
  final RxList<dynamic> historyData = <dynamic>[].obs;
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
        await fetchChildren();
        if (childrenList.isNotEmpty) {
          selectedChild.value = childrenList[0]['id'].toString();
          await fetchHistory(selectedChild.value);
        }
      }
    } catch (e) {
      print('Load user data error: $e');
    }
  }

  Future<void> fetchChildren() async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://e976-114-6-25-184.ngrok-free.app/api/child-growth-monitoring/1/children'),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final decodedResponse = jsonDecode(response.body);
        if (decodedResponse['status'] == 'success' &&
            decodedResponse['data'] != null) {
          childrenList.value = decodedResponse['data'];
        }
      }
    } catch (e) {
      print('Fetch children error: $e');
    }
  }

  Future<void> fetchHistory(String childId) async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://e976-114-6-25-184.ngrok-free.app/api/child-growth-monitoring?child_id=$childId'),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final decodedResponse = jsonDecode(response.body);
        if (decodedResponse['data'] != null) {
          historyData.value = decodedResponse['data'];
        }
      }
    } catch (e) {
      print('Fetch history error: $e');
    }
  }

  void onChildSelected(String? value) async {
    if (value != null) {
      selectedChild.value = value;
      await fetchHistory(value);
    }
  }

  void back() {
    Get.back();
  }
}
