import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stunting_app/features/jadwal/models/imunitation.dart';
import 'package:stunting_app/features/jadwal/models/jadwal_model.dart';
import 'package:stunting_app/features/jadwal/models/schedule.dart';

class JadwalApiConstant {
  static const String baseUrl = "https://e976-114-6-25-184.ngrok-free.app/api";

  // Fetch the list of Posyandu
  static Future<List<Posyandu>> fetchPosyandu() async {
    final response = await http.get(Uri.parse("$baseUrl/posyandu"));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];
      return data.map((item) => Posyandu.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load Posyandu');
    }
  }

  // Fetch the list of dates for a specific Posyandu by its ID
  static Future<List<Schedule>> fetchDates(int posyanduId) async {
    final response = await http
        .get(Uri.parse("$baseUrl/posyandu/schedule/$posyanduId/dates"));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];
      // Convert the list of strings directly to Schedule objects
      return data.map((date) => Schedule.fromJson(date.toString())).toList();
    } else {
      throw Exception('Failed to load dates');
    }
  }

   static Future<List<ImmunizationSchedule>> fetchImmunizations(
      int posyanduId, String scheduleDate) async {
    try {
      // Update the endpoint to use the correct path
      final response = await http.get(
        Uri.parse(
            "$baseUrl/posyandu/schedule?posyandu_id=$posyanduId&schedule_date=$scheduleDate"),
      );

      print("API Response for schedules: ${response.body}"); // For debugging

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        if (jsonResponse['status'] == 'success') {
          final List<dynamic> data = jsonResponse['data'];
          return data
              .map((item) => ImmunizationSchedule.fromJson(item))
              .toList();
        } else {
          throw Exception(jsonResponse['message'] ??
              'Failed to load immunization schedule');
        }
      } else {
        throw Exception(
            'Failed to load immunization schedule: ${response.statusCode}');
      }
    } catch (e) {
      print('Error in fetchImmunizations: $e');
      rethrow;
    }
  }
}
