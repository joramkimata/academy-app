import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:izwebacademy_app/config/app_config.dart';

final String apiUrl = AppConfig.BASE_URL;

Future<Map<String, dynamic>> postCall(String endpoint, dynamic data) async {
  final http.Response response = await http.post(apiUrl + endpoint,
      body: json.encode(data), headers: {"Content-Type": "application/json"});
  final Map<String, dynamic> responseData = json.decode(response.body);
  return responseData;
}


Future<Map<String, dynamic>> getCall(String endpoint) async {
  final http.Response response = await http.get(apiUrl + endpoint, headers: {"Content-Type": "application/json"});
  final Map<String, dynamic> responseData = json.decode(response.body);
  return responseData;
}