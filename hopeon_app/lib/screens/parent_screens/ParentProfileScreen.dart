import 'package:flutter/material.dart';
import 'package:hopeon_app/screens/parent_screens/ParentBottomNavBar.dart';

class ParentProfileScreen extends StatelessWidget {
  const ParentProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Profile details"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          // Profile Image
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage("assets/images/profile-parent.png"),
          ),
          const SizedBox(height: 10),
          // Student Name
          const Text(
            "Student Name",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Text(
            "Dinelka Perera",
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          // Buttons
          _buildButton("Edit Student details"),
          _buildButton("Reset Password"),
          _buildButton("Log Out"),
        ],
      ),
      bottomNavigationBar: ParentBottomNavBar(selectedScreen:3),
    );
  }

  Widget _buildButton(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: () {},
        child: Text(text, style: const TextStyle(fontSize: 16, color: Colors.white)),
      ),
    );
  }
}
