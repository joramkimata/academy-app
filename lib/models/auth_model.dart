import 'package:flutter/foundation.dart';
import 'package:izwebacademy_app/support/http/http_calls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthModel extends ChangeNotifier {
  Future<Map<String, dynamic>> sigin(String email, String password) async {
    final Map<String, dynamic> authData = {
      "email": email,
      "password": password
    };

    return postCall("/login", authData);
  }

  void storeToken(token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  getStoredToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }
}
