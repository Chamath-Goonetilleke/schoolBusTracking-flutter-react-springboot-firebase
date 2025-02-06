import 'package:flutter/material.dart';

class StudentInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Student Info",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // Profile Image
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        "https://www.w3schools.com/howto/img_avatar.png"), // Replace with actual image URL
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Student Information
              SizedBox(
                width: double.infinity,
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [infoText("Student Name", "Dinelka Perera"),
                  infoText("Parent Name", "Sunil Jayathilaka"),
                  infoText("Contact Number", "0744444666"),
                  infoText("School", "WP/ Gankanda Central College"),
                  infoText("Grade", "5E"),
                  infoText("Gender", "Male"),
                  infoText("Age", "10 Years"),
                  infoText("Location", "Kesbewa Junction"),],),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Widget for each info row
  Widget infoText(String title, String value) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 30, 10),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Text(
              value,
              style: const TextStyle(fontSize: 18),
            ),
        ],
      ),
    );
  }
}
