import 'dart:convert';

import 'package:stunting_app/features/login/models/login_model.dart';
import 'package:http/http.dart' as http;
class LoginApiConstant {
 final String _baseUrl =
      'https://e976-114-6-25-184.ngrok-free.app/api/auth/login';

  Future<LoginResponse> login(String email, String password) async {
    final response = await http.post(
      Uri.parse(_baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      return LoginResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Login failed');
    }
  }
}
