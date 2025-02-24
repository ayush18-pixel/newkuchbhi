import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kuchbhi/pages/login_page.dart';
import 'dart:io';
import 'dart:convert'; // For Base64 encoding/decoding
import 'package:image/image.dart' as img; // Add prefix 'img' to avoid conflict

class ProfilePage extends StatelessWidget {
  // Function to convert Base64 image to PNG
  Future<File?> convertBase64ToPng(String base64Image) async {
    try {
      // Decode the Base64 string
      final imageBytes = base64Decode(base64Image);

      // Decode the image using the `image` package
      final decodedImage = img.decodeImage(imageBytes);

      // Encode the image as PNG
      final pngBytes = img.encodePng(decodedImage!);

      // Save the PNG image to a temporary file
      final tempDir = Directory.systemTemp;
      final file = File('${tempDir.path}/profile_image.png');
      await file.writeAsBytes(pngBytes);

      return file;
    } catch (e) {
      print('Error converting Base64 to PNG: $e');
      return null;
    }
  }

  Future<void> _signOut(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Sign Out'),
        content: Text('Are you sure you want to sign out?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text('Sign Out'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(isSignedOut: true, onToggle: () {}),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final userId = FirebaseAuth.instance.currentUser!.uid;

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blueGrey.shade900,
              Colors.blueGrey.shade700,
              Colors.blueGrey.shade500,
            ],
          ),
        ),
        child: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance.collection('users').doc(userId).snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (!snapshot.hasData || !snapshot.data!.exists) {
              return Center(child: Text("No user data found."));
            }

            final userData = snapshot.data!.data() as Map<String, dynamic>?;

            if (userData == null) {
              return Center(child: Text("User data is null."));
            }

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Column(
                            children: [
                              // Display the user's profile image
                              FutureBuilder<File?>(
                                future: userData['profileImage'] != null
                                    ? convertBase64ToPng(userData['profileImage'])
                                    : Future.value(null),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState == ConnectionState.waiting) {
                                    return CircleAvatar(
                                      radius: 55,
                                      backgroundImage: AssetImage('assets/user.png'),
                                    );
                                  }

                                  if (snapshot.hasData && snapshot.data != null) {
                                    return CircleAvatar(
                                      radius: 55,
                                      backgroundImage: FileImage(snapshot.data!),
                                    );
                                  }

                                  return CircleAvatar(
                                    radius: 55,
                                    backgroundImage: AssetImage('assets/user.png'),
                                  );
                                },
                              ),
                              SizedBox(height: 8),
                              Text(
                                "${userData['firstName']} ${userData['lastName']}",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                userData['email'],
                                style: TextStyle(fontSize: 16, color: Colors.grey.shade300),
                              ),
                              SizedBox(height: 2),
                              Text(
                                userData['contact'],
                                style: TextStyle(fontSize: 16, color: Colors.grey.shade300),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Divider(thickness: 1.2, color: Colors.white30),
                        SizedBox(height: 10),

                        // Age & Gender
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Age: ${userData['age']}", style: TextStyle(fontSize: 16, color: Colors.white70)),
                            Text("Gender: ${userData['gender']}", style: TextStyle(fontSize: 16, color: Colors.white70)),
                          ],
                        ),
                        SizedBox(height: 10),
                        Divider(thickness: 1.2, color: Colors.white30),
                        SizedBox(height: 10),

                        // Address
                        Text(
                          "Location: ${userData['location']}",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
                        ),
                        SizedBox(height: 8),

                        // User Rating
                        Text(
                          "User Rating: ⭐⭐⭐⭐",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.amber),
                        ),
                        SizedBox(height: 10),
                        Divider(thickness: 1.2, color: Colors.white30),
                        SizedBox(height: 8),

                        // Sign Out Button with Icon
                        SizedBox(height: 20),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white38, width: 1.5),
                          ),
                          child: ElevatedButton.icon(
                            onPressed: () => _signOut(context),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              foregroundColor: Colors.white,
                              shadowColor: Colors.transparent,
                              padding: EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            icon: Icon(Icons.logout, size: 20, color: Colors.white70),
                            label: Text("Sign Out", style: TextStyle(fontSize: 16)),
                          ),
                        ),

                        // Rate the App Button with Icon
                        SizedBox(height: 12),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white38, width: 1.5),
                          ),
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              foregroundColor: Colors.white,
                              shadowColor: Colors.transparent,
                              padding: EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            icon: Icon(Icons.star_border, size: 20, color: Colors.white70),
                            label: Text("Rate the App", style: TextStyle(fontSize: 16)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}