import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AuthService {
  final String _apiUrl = dotenv.env['URL']!;
  final String _apiKey = dotenv.env['KEY']!;

  signUpPatient(Map<String, String> info) async {
    var url = Uri.https(_apiUrl, '/auth/v1/signup');
    var response = await http.post(url,
        body: jsonEncode(info),
        headers: {"Content-Type": "application/json", "apiKey": _apiKey});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  loginPatient(Map<String, String> info) async {
    print('in login');
    var url = Uri.https(_apiUrl, 'auth/v1/token?grant_type=password');
    var response = await http.post(url,
        body: jsonEncode(info),
        headers: {"Content-Type": "application/json", "apiKey": _apiKey});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
}
