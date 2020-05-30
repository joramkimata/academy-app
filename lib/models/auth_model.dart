import 'package:flutter/foundation.dart';
import 'package:izwebacademy_app/support/http/http_calls.dart';

class AuthModel extends ChangeNotifier {
  Future<Map<String, dynamic>> sigin(String email, String password) async {
    final Map<String, dynamic> authData = {
      "email": email,
      "password": password
    };

    return postCall("/login", authData);
  }
}
