import 'package:flutter/material.dart';
import 'package:hopeon_app/screens/driver_screens/DriverAttendanceScreen.dart';

class ToSchoolAttendanceScreen extends StatefulWidget {
  const ToSchoolAttendanceScreen({super.key});

  @override
  State<ToSchoolAttendanceScreen> createState() =>
      _ToSchoolAttendanceScreenState();
}

class _ToSchoolAttendanceScreenState extends State<ToSchoolAttendanceScreen> {

  final List<Map<String, dynamic>> students = [
    {
      "name": "Chamath Goonetilleke",
      "isPresent": true
    },
    {
      "name": "Chamath Goonetilleke",
      "isPresent": false
    },
    {
      "name": "Chamath Goonetilleke",
      "isPresent": true
    },
    {
      "name": "Chamath Goonetilleke",
      "isPresent": true
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.fromLTRB(0, 30, 0, 10),
          child: Text("To School Attendance - September 24",
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const DriverAttendanceScreen()),
            )
          },
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: students.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage("assets/images/profile-parent.png"),
                    ),
                    SizedBox(width: 20,),
                    Text(students[index]["name"]),
                  ],
                ),
                Switch(value: students[index]["isPresent"], onChanged: (value) => {}, )
              ],
            ),
          );
        },
      ),
    );
  }
}
