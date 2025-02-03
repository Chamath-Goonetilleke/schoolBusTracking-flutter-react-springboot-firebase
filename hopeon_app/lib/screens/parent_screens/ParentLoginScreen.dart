import 'package:flutter/material.dart';
import 'package:hopeon_app/screens/parent_screens/ParentDashboardScreen.dart';

class ParentLoginScreen extends StatefulWidget {
  const ParentLoginScreen({Key? key}) : super(key: key);

  @override
  _ParentLoginScreenState createState() => _ParentLoginScreenState();
}

class _ParentLoginScreenState extends State<ParentLoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          // Wrap the content with SingleChildScrollView
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
                children: [
                  Image.asset(
                    "assets/images/parent_login.png",
                    width: 300, // Set a reasonable width
                    height: 300, // Set a reasonable height
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Welcome Back",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  const SizedBox(height: 20),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // Email Field
                        SizedBox(
                          width: 300, // Set text field width to 300
                          child: TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              prefixIcon: const Icon(Icons.email), // Start icon
                              border: OutlineInputBorder(
                                // Full border
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              if (!RegExp(
                                      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                                  .hasMatch(value)) {
                                return 'Enter a valid email';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Password Field
                        SizedBox(
                          width: 300, // Set text field width to 300
                          child: TextFormField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              prefixIcon: const Icon(Icons.lock), // Start icon
                              border: OutlineInputBorder(
                                // Full border
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            obscureText: true, // Hide password text
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              if (value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 40, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector( child: const Text("Forgot Password"), onTap: () {

                              },),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                        MaterialButton(
                          onPressed: () {
                            if (!_formKey.currentState!.validate()) {
                              // Handle login logic
                              // ScaffoldMessenger.of(context).showSnackBar(
                              //   const SnackBar(content: Text('Logging in...')),
                              // );
                              Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ParentDashboardScreen()),
                          );
                            }
                          },
                          minWidth: 300,
                          color: Color.fromRGBO(58, 89, 243, 1),
                          child: const Text(
                            "Log In",
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        
      ),
    );
  }
}
