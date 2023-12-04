import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:unwind_app/model/url.dart';
import 'package:unwind_app/dto/user_dto.dart';

class AuthService {
  static const _key = "userToken";

  Future<String?> userToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(_key);
    return token;
  }

  Future<void> updateUserToken(String? userToken) async {
    final prefs = await SharedPreferences.getInstance();

    if (userToken == null) {
      await prefs.remove(_key);
      return;
    }

    await prefs.setString(_key, userToken);
  }

  Future<UserDTO?> user(String token) async {
    final uri = Uri.parse('$baseUrl/user/details');
    final res = await http.get(uri, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (res.statusCode == 200) {
      final user = parseUser(res.body);
      return user;
    }

    return null;
  }

  Future<UserDTO?> verifyCredentials(
    String email,
    String password,
  ) async {
    final uri = Uri.parse('$baseUrl/auth/signin');
    final res = await http.post(
      uri,
      headers: {
        'Content-Type': "application/json",
      },
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (res.statusCode == 200) {
      try {
        final user = parseUser(res.body);
        return user;
      } catch (e) {
        return null;
      }
    }

    return null;
  }
}
