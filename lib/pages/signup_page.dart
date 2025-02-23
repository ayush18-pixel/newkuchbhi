import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../services/auth_service.dart'; // AuthService for Firebase auth
import '../services/otp_service.dart'; // OTPService for Brevo OTP sending
import '../services/firestore_service.dart'; // FirestoreService for OTP storage
import 'otp_verify.dart';
import 'prof_sign_page.dart'; // Import the ProfilePage

class SignupPage extends StatefulWidget {
  final VoidCallback onToggle;
  SignupPage({required this.onToggle});

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final AuthService _authService = AuthService();

  void _signUp() async {
    // Validate email domain
    if (!emailController.text.endsWith('iitmandi.ac.in')) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Only IIT Mandi emails are allowed")),
      );
      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Passwords do not match")),
      );
      return;
    }

    // Generate a 6-digit OTP
    final otp = (100000 + (DateTime.now().millisecondsSinceEpoch % 900000)).toString();
    print("Generated OTP: $otp");

    // Send OTP via Brevo
    final otpSent = await OTPService.sendOTP(emailController.text, otp);
    print("OTP Sent: $otpSent");

    if (!otpSent) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to send OTP")),
      );
      return;
    }

    // Store OTP in Firestore
    await FirestoreService.storeOTP(emailController.text, otp);
    print("OTP stored in Firestore");

    // Proceed with Firebase sign-up
    User? user = await _authService.signUp(emailController.text, passwordController.text);
    print("User Created: ${user?.uid}");

    if (user != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => OTPVerifyPage(email: emailController.text, userId: user.uid),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Signup Failed")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black87, Colors.black54], // Smooth gradient
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    'assets/logo.svg',
                    height: 200, // Reduced height to avoid overflow
                    width: 200,
                  ),
                  SizedBox(height: 15), // Adjusted spacing
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: confirmPasswordController,
                    decoration: InputDecoration(
                      labelText: "Confirm Password",
                      labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 12), // Adjusted spacing
                  ElevatedButton(
                    onPressed: _signUp,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow.shade100,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 14), // Slightly reduced padding
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 6,
                      shadowColor: Colors.tealAccent.withOpacity(0.5),
                    ),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 18, // Slightly reduced font size
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.1,
                        color: Colors.black87, // Fix: Use Colors.black87
                      ),
                    ),
                  ),
                  SizedBox(height: 8), // Added spacing before the login button
                  TextButton(
                    onPressed: widget.onToggle,
                    child: Text(
                      "Already have an account? Login",
                      style: TextStyle(
                        fontSize: 15, // Slightly reduced font size
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 10), // Additional spacing for better layout
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}