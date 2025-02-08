import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class ParentService{
  final String baseUrl = "http://10.0.2.2:8080/api/v1/student";

  Future<Map<String, dynamic>?> getStudent(String id) async {
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

  Future<bool> updateStudent(String email, String password) async {
    final url = Uri.parse("$baseUrl/user/auth");
    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": email,
          "password": password,
          "type": "STUDENT"
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data["status"] == 200 && data["object"] != null) {
          final user = data["object"];
          String userId = user['id'].toString();
          String userEmail = user['email'];
          String userType = user['type'];
          String fullName = user['fullName'];

          // // Save credentials
          // await saveUserCredentials(userId, userEmail, userType, fullName);
          return true;
        }
      }
      return false;
    } catch (e) {
      print("Login error: $e");
      return false;
    }
  }



}