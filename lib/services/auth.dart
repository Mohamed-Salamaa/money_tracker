import 'package:http/http.dart' as http;
import 'dart:convert';


class AuthService {
  static const String baseUrl = 'http://192.168.18.2:8005/api/method/';

  // Signup Request
  Future<http.Response> signup(String name, String email, String password, String mobile, String? gender, String? birthdate) async {
    return await http.post(
      Uri.parse('${baseUrl}money_tracker.api.auth.signup'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'name': name,
        'email': email,
        'password': password,
        'mobile': mobile,
        'gender': gender,
        'birth_date': birthdate
      }),
    );
  }

  // Login Request
  Future<http.Response> login(String email, String password) async {
    return await http.post(
      Uri.parse('${baseUrl}money_tracker.api.auth.login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );
  }
}