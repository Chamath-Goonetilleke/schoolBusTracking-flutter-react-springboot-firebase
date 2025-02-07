import 'package:flutter/material.dart';
import 'package:hopeon_app/screens/common_screens/OTPVerificationScreen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Forgot Password", style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),),
              const SizedBox(height: 30,),
              const Text("Please enter your email address", style: TextStyle(fontSize: 20)),
              const Text("to receive a new OTP", style: TextStyle(fontSize: 20)),
              const SizedBox(height: 20,),
              TextFormField(
                initialValue: "Email",
              ),
              const SizedBox(height: 40,),

              MaterialButton(
                padding: const EdgeInsets.all(10),
                color: const Color.fromRGBO(37, 100, 255, 1.0),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OTPVerificationScreen()),
                  );
                },
                minWidth: 300,
                child: const Text("Continue",
                    style: TextStyle(fontSize: 20, color: Colors.white)),
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Remember password?", style: TextStyle(fontSize: 17)),
                  const SizedBox(width: 10,),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Log In",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),


            ],
          ),
        ),
      ),
    );
  }
}
