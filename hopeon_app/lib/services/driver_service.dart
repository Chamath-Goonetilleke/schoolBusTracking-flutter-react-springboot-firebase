import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class DriverService{
  final String baseUrl = "http://10.0.2.2:8080/api/v1/driver";
  Future<Map<String, dynamic>?> getDriver(String id) async {
    final url = Uri.parse("$baseUrl/findById?id=$id");
    try {
      final response = await http.get(
          url,
          headers: {"Content-Type": "application/json"}
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data["status"] == 200 && data["object"] != null) {
          final user = data["object"];
          return user;
        }
      }
      return null;
    } catch (e) {
      print("Login error: $e");
      return null;
    }
  }
}