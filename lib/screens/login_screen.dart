import 'package:flutter/material.dart';
import '../services/api_service.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final ApiService apiService = ApiService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _login() async {
    try {
      final result = await apiService.login(
          emailController.text, passwordController.text);
      print(result);  // Handle login success, display or navigate based on result
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Login successful!'),
        backgroundColor: Colors.green,
      ));
    } catch (error) {
      print(error);   // Handle error
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Login failed: $error'),
        backgroundColor: Colors.red,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Main background
          Container(
            color: Color(0xff01070B), // Set the main background to black
          ),
          // Header section
          Container(
            height: screenHeight * 0.15, // Increased height for the header
            color: Color(0xFF111418), // Set the header background to #1E1E1E
            child: Center(
              child: Text(
                "Project Name", // Change this to your project's name
                style: TextStyle(
                  fontSize: screenWidth * 0.08, // Increased font size
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          // Main content
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1, vertical: screenHeight * 0.1),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight * 0.05),
                  // Header: Logo or App Title
                  Center(
                    child: Column(
                      children: [
                        Icon(Icons.account_circle, size: screenWidth * 0.25, color: Colors.white),
                        SizedBox(height: screenHeight * 0.02),
                        Text(
                          "Welcome Back!",
                          style: TextStyle(
                            fontSize: screenWidth * 0.08,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  // Email field
                  TextFormField(
                    controller: emailController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: TextStyle(color: Colors.white70),
                      fillColor: Color(0xFF111418), // Change to #111418
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Icon(Icons.email, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  // Password field
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(color: Colors.white70),
                      fillColor: Color(0xFF111418), // Change to #111418
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Icon(Icons.lock, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  // Forgot Password
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // Navigate to forgot password
                      },
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  // Login Button
                  Center(
                    child: ElevatedButton(
                      onPressed: _login,
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.deepPurple,
                        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.2, vertical: screenHeight * 0.02),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: Text("Login", style: TextStyle(fontSize: screenWidth * 0.05)),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  // Removed Register Now Button to eliminate footer
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
