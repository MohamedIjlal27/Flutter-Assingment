import 'package:flutter/material.dart';
import 'package:test_drive/Module/forgetPassword_Module.dart';
import 'package:test_drive/widgets/reusable_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/auth.dart';
import 'dashboard_screen.dart'; // Import your dashboard screen

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? errorMessage = '';
  bool isLogin = true;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool rememberPassword = false;

  Future<void> signWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
      // Navigate to dashboard if sign-in is successful
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashboardScreen()),
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> createUserWithEmailPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget _title() {
    return const Text('Firebase Auth');
  }

  Widget _entryField(
    String title,
    TextEditingController controller,
  ) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(labelText: title),
    );
  }

  Widget _errorMessage() {
    return Text(errorMessage == '' ? '' : 'Humm? $errorMessage');
  }

  Widget _submitButton() {
    return ElevatedButton(
      onPressed: signWithEmailAndPassword,
      child: const Text('Login'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              20, MediaQuery.of(context).size.height * 0.2, 20, 0),
          child: Column(
            children: <Widget>[
              Image.asset(
                "assets/images/merchant-logo.png",
                width: 100,
                height: 100,
              ),
              const SizedBox(
                  height: 5), // Space between the logo and text fields

              // Email TextField
              reusableTextField(
                "Enter Email Address",
                Icons.email,
                false,
                _emailController,
              ),
              const SizedBox(height: 16.0), // Space between the text fields

              // Password TextField
              reusableTextField(
                "Enter Password",
                Icons.lock,
                true,
                _passwordController,
              ),
              const SizedBox(height: 16.0),

              // Remember Password Row
              Row(
                children: [
                  Checkbox(
                    value: rememberPassword,
                    onChanged: (value) {
                      setState(() {
                        rememberPassword = value ?? false;
                      });
                    },
                  ),
                  const Text(
                    "Remember Me",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),

              // Login Button
              reusableButton(context, "LogIn", signWithEmailAndPassword),

              // Forgot Password TextButton
              TextButton(
                onPressed: () {
                  ForgotPasswordDialog.show(context);
                },
                child: const Text(
                  "Forgot Password?",
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),

              // Image (Optional, depending on design)
              Image.asset(
                "assets/images/delivery-boy.gif",
                height: 150,
              ),
              const SizedBox(height: 20),

              _errorMessage(),
            ],
          ),
        ),
      ),
    );
  }
}
