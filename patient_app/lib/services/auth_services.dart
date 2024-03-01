import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mussefy_app/models/patient.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final supabase = Supabase.instance.client;
  final String _apiUrl = dotenv.env['URL']!;
  final String _apiKey = dotenv.env['KEY']!;

  //---------Using Supabase Api--------------
  signUpPatientApi(Map<String, String> info) async {
    var url = Uri.parse('$_apiUrl/auth/v1/signup');
    try {
      var response = await http.post(url,
          body: jsonEncode(info),
          headers: {"Content-Type": "application/json", "apiKey": _apiKey});
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    } catch (e) {
      print('Error: $e');
    }
  }

  loginPatientApi(Map<String, String> info) async {
    var url = Uri.parse('$_apiUrl/auth/v1/token?grant_type=password');
    try {
      var response = await http.post(
        url,
        body: jsonEncode(info),
        headers: {
          "apiKey": _apiKey,
          "Content-Type": "application/json",
        },
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${jsonDecode(response.body)}');
    } catch (e) {
      print('Error: $e');
    }
  }

  //----Using Supabase Client--------------------------
  signUpPatient(String email, String password) async {
    try {
      final response = await supabase.auth.signUp(
        email: email,
        password: password,
      );
      return response;
    } on AuthException catch (e) {
      print(e.message);
      throw AuthException(e.message);
    } catch (e) {
      throw Error();
    }
  }

  loginPatient(
    String email,
    String password,
  ) async {
    try {
      final x = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      final response =
          await supabase.from('patients').select().eq('email', email);

      return Patient.fromJson(response[0]);
    } on AuthException catch (e) {
      throw AuthException(e.message);
    } catch (e) {
      throw Error();
    }
  }

  verfiyOTP(String email, String token, Patient patient) async {
    try {
      final temp = await supabase.auth
          .verifyOTP(email: email, token: token, type: OtpType.signup);
      print(temp);
      final response =
          await supabase.from('patients').insert(patient.toJson()).select();
      return response;
    } on AuthException catch (e) {
      throw AuthException(e.message);
    } catch (e) {
      throw Error();
    }
  }

  signOutPatient() async {
    try {
      final response = await supabase.auth.signOut();
      return response;
    } on AuthException catch (e) {
      throw AuthException(e.message);
    } catch (e) {
      throw Error();
    }
  }
}
