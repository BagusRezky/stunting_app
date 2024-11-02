import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stunting_app/features/saran_makan/models/saran_model.dart';

class SaranMakanService {
  final String _baseUrl =
      'https://e976-114-6-25-184.ngrok-free.app/api/gen-ai/food-recommendation';

  Future<http.Response> generateSaranMakan(
      SaranMakan request) async {
    final response = await http.post(
      Uri.parse(_baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(request.toJson()),
    );
    return response;
  }
}
