import 'package:flutter/material.dart';
import 'package:hopeon_app/screens/parent_screens/EditStudentScreen.dart';
import 'package:hopeon_app/screens/parent_screens/ParentBottomNavBar.dart';

class ParentProfileScreen extends StatelessWidget {
  const ParentProfileScreen({Key? key}) : super(key: key);

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
            const Text("Dinelka Perera",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 80),
            // Buttons
            _buildButton("Edit Student details", (){
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => EditStudentScreen()),
              );
            }),
            _buildButton("Reset Password", (){}),
            _buildButton("Log Out", (){}),
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
