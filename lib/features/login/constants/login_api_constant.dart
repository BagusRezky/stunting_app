import 'dart:convert';

import 'package:stunting_app/features/login/models/login_model.dart';
import 'package:http/http.dart' as http;
class LoginApiConstant {
  // Consider moving this to an environment config
  final String _baseUrl =
      'https://e976-114-6-25-184.ngrok-free.app/api/auth/login';

  Future<LoginResponse> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode({
          'email': email,
          'password': password,
        }),
      );

      print('Response status: ${response.statusCode}'); // For debugging
      print('Response body: ${response.body}'); // For debugging

      if (response.statusCode == 200) {
        return LoginResponse.fromJson(json.decode(response.body));
      } else {
        // Parse error response if possible
        try {
          final errorBody = json.decode(response.body);
          throw Exception(errorBody['message'] ??
              'Login failed with status: ${response.statusCode}');
        } catch (_) {
          throw Exception('Login failed with status: ${response.statusCode}');
        }
      }
    } catch (e) {
      print('API Error: $e'); // For debugging
      throw Exception('Network error: $e');
    }
  }

  
}
