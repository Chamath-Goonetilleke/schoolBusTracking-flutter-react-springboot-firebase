import 'package:flutter/material.dart';
import 'package:hopeon_app/services/auth_service.dart';
import 'package:hopeon_app/services/parent_service.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class EditStudentScreen extends StatefulWidget {
  final String id;

  const EditStudentScreen({super.key, required this.id});
  @override
  _EditStudentScreenState createState() => _EditStudentScreenState();
}

class _EditStudentScreenState extends State<EditStudentScreen> {
  final TextEditingController _parentNameController = TextEditingController();
  final TextEditingController _contactNumberController = TextEditingController();
  final TextEditingController _gradeController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  File? _image;
  final ParentService _parentService = ParentService();
  late Map<String, dynamic> user;

  @override
  void initState() {
    super.initState();
    _loadStudentData();
  }

  void _loadStudentData() async{

    Map<String, dynamic>? fetchUser = await _parentService.getStudent(widget.id);

    if(fetchUser != null){
      setState(() {
        user = fetchUser;
        _parentNameController.text = fetchUser['parentName'];
        _contactNumberController.text = fetchUser['contactNo'];
        _gradeController.text = fetchUser['grade'] + " - "+fetchUser['studentClass'] ;
        _ageController.text = "${fetchUser['age']}";
        _locationController.text = fetchUser['location'];
      });
    }

  }

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _updateStudentDetails() {
    // Here you would usually send the updated data to a backend or database
    print("Updated Details:");
    print("Parent Name: ${_parentNameController.text}");
    print("Contact Number: ${_contactNumberController.text}");
    print("Grade: ${_gradeController.text}");
    print("Age: ${_ageController.text}");
    print("Location: ${_locationController.text}");

    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Student details updated successfully!"))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Student details"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: GestureDetector(
                  onTap: _pickImage,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: _image != null
                        ? FileImage(_image!)
                        : AssetImage("assets/default_profile.png") as ImageProvider,
                    child: Icon(Icons.camera_alt, size: 30, color: Colors.black54),
                  ),
                ),
              ),
              SizedBox(height: 20),
              _buildTextField("Parent Name", _parentNameController),
              _buildTextField("Contact Number", _contactNumberController),
              _buildTextField("Grade", _gradeController),
              _buildTextField("Age", _ageController),
              _buildTextField("Location", _locationController),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _updateStudentDetails,
                  child: Text("Update"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    textStyle: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            filled: true,
            fillColor: Color.fromRGBO(227, 240, 255,1),
          ),
        ),
        SizedBox(height: 15),
      ],
    );
  }
}
