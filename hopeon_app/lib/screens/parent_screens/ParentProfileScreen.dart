import 'package:flutter/material.dart';
import 'package:hopeon_app/screens/common_screens/OTPVerificationScreen.dart';
import 'package:hopeon_app/screens/parent_screens/EditStudentScreen.dart';
import 'package:hopeon_app/screens/parent_screens/ParentBottomNavBar.dart';
import 'package:hopeon_app/screens/parent_screens/ParentLoginScreen.dart';
import 'package:hopeon_app/services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ParentProfileScreen extends StatefulWidget {
  const ParentProfileScreen({Key? key}) : super(key: key);

  @override
  State<ParentProfileScreen> createState() => _ParentProfileScreenState();
}

class _ParentProfileScreenState extends State<ParentProfileScreen> {
  late Map<String, String?> user;
  final AuthService _authService = AuthService();

  bool _isLoading = false;

  void _handleOTPSend() async {
    setState(() => _isLoading = true);

    bool success =
    await _authService.sendOTPRequest(user['email']!, "STUDENT");

    setState(() => _isLoading = false);

    if (success) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OTPVerificationScreen(email: user['email']!, type: "STUDENT",)),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Invalid email")),
      );
    }
  }

  Future<void> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      user={
        "id": prefs.getString("user_id"),
        "email": prefs.getString("user_email"),
        "type": prefs.getString("user_type"),
        "fullName": prefs.getString("full_name"),
      };
    });
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: const Color.fromRGBO(37, 100, 255, 1.0),
              padding: const EdgeInsets.fromLTRB(30, 80, 10, 20),
              child: const Text("Profile", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white))
            ),
            const SizedBox(height: 50),
            // Profile Image
            const CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage("assets/images/profile-parent.png"),
            ),
            const SizedBox(height: 10),
            // Student Name
            Text(user['fullName']!,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 80),
            // Buttons
            _buildButton("Edit Student details", (){
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => EditStudentScreen(id:user['id']!)),
              );
            }),
            _buildButton("Reset Password", _handleOTPSend),
            _buildButton("Log Out", (){
              _authService.logOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const ParentLoginScreen()),
              );
            }),
          ],
        ),
      ),
      bottomNavigationBar: ParentBottomNavBar(selectedScreen: 3),
    );
  }

  Widget _buildButton(String text, onPressed) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: MaterialButton(
        padding: EdgeInsets.all(10),
        color: const Color.fromRGBO(37, 100, 255, 1.0),
        onPressed: onPressed,
        minWidth: 300,
        child: Text(text,
            style: const TextStyle(fontSize: 16, color: Colors.white)),
      ),
    );
  }
}
