import 'package:flutter/material.dart';

class EditDriverScreen extends StatefulWidget {
  @override
  _EditDriverScreenState createState() => _EditDriverScreenState();
}

class _EditDriverScreenState extends State<EditDriverScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController vehicleNumberController = TextEditingController();
  final TextEditingController vehicleTypeController = TextEditingController();
  final TextEditingController routeDetailsController = TextEditingController();
  final TextEditingController experienceController = TextEditingController();
  final TextEditingController nicNumberController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadDriverData();
  }

  void _loadDriverData() {
    // Simulating fetching data from a database or API
    setState(() {
      nameController.text = "Anil Karunathilaka";
      contactController.text = "0743333566";
      vehicleNumberController.text = "BC-6589";
      vehicleTypeController.text = "Bus";
      routeDetailsController.text = "Kesbewa - Colombo";
      experienceController.text = "10 Years";
      nicNumberController.text = "2578453625V";
      ageController.text = "47 Years";
    });
  }

  void _saveChanges() {
    // Logic to save updated driver details
    print("Driver details updated:");
    print("Name: ${nameController.text}");
    print("Contact: ${contactController.text}");
    print("Vehicle Number: ${vehicleNumberController.text}");
    print("Vehicle Type: ${vehicleTypeController.text}");
    print("Route: ${routeDetailsController.text}");
    print("Experience: ${experienceController.text}");
    print("NIC: ${nicNumberController.text}");
    print("Age: ${ageController.text}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Driver details"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/driver_placeholder.png'),
            ),
            SizedBox(height: 20),
            _buildTextField("Driver Name", nameController),
            _buildTextField("Contact Number", contactController),
            _buildTextField("Vehicle Number", vehicleNumberController),
            _buildTextField("Vehicle Type", vehicleTypeController),
            _buildTextField("Route Details", routeDetailsController),
            _buildTextField("Experience", experienceController),
            _buildTextField("Nic Number", nicNumberController),
            _buildTextField("Age", ageController),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveChanges,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: Text("Update", style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
          filled: true,
          fillColor: Colors.blue.shade50,
        ),
      ),
    );
  }
}
