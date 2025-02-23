import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kuchbhi/pages/login_page.dart';

bool signout = false;

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userId = FirebaseAuth.instance.currentUser!.uid;

    return Scaffold(
      body: StreamBuilder<DocumentSnapshot>(
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

          return Container(
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
            child: SingleChildScrollView( // Add SingleChildScrollView here
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 55,
                          backgroundImage: AssetImage('assets/user.png'),
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

                  // Change Password Button with Icon
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
                      icon: Icon(Icons.lock_outline, size: 20, color: Colors.white70),
                      label: Text("Change Password", style: TextStyle(fontSize: 16)),
                    ),
                  ),

                  // Extra Spacer to Lower Buttons
                  SizedBox(height: 20), // Replaced Spacer with SizedBox for better control

                  // Sign Out & Rate the App Buttons with Icons
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: Row(
                      children: [
                        // Sign Out Button with Icon
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.white38, width: 1.5),
                            ),
                            child: ElevatedButton.icon(
                              onPressed: () {
                                signout = true;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginPage(
                                      onToggle: () {}, // You can leave it empty if toggle is not needed
                                    ),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                foregroundColor: Colors.white,
                                shadowColor: Colors.transparent,
                                padding: EdgeInsets.symmetric(vertical: 14),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              icon: Icon(Icons.logout, size: 20, color: Colors.white70),
                              label: Text("Sign Out", style: TextStyle(fontSize: 16)),
                            ),
                          ),
                        ),
                        SizedBox(width: 12),

                        // Rate the App Button with Icon
                        Expanded(
                          child: Container(
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
                                padding: EdgeInsets.symmetric(vertical: 14),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              icon: Icon(Icons.star_border, size: 20, color: Colors.white70),
                              label: Text("Rate the App", style: TextStyle(fontSize: 16)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}