import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'home_page.dart';

class ProfilePage extends StatefulWidget {
  final String userId; // Add userId parameter
  ProfilePage({required this.userId}); // Update constructor

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  String? gender;
  String? location;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void _saveProfile() async {
    // Save profile data to Firestore
    await _firestore.collection('users').doc(widget.userId).set({
      'firstName': firstNameController.text,
      'lastName': lastNameController.text,
      'contact': contactController.text,
      'age': ageController.text,
      'gender': gender,
      'location': location,
      'email': FirebaseAuth.instance.currentUser!.email, // Save user email
    });

    // Navigate to the main app screen (e.g., HomePage)
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey[300],
                    child: Icon(Icons.person, size: 50, color: Colors.white),
                  ),
                  FloatingActionButton(
                    mini: true,
                    child: Icon(Icons.add_a_photo),
                    onPressed: () {
                      // Handle pick image action
                    },
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: firstNameController,
              decoration: InputDecoration(labelText: 'First Name'),
            ),
            TextFormField(
              controller: lastNameController,
              decoration: InputDecoration(labelText: 'Last Name'),
            ),
            TextFormField(
              controller: contactController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(labelText: 'Contact Number'),
            ),
            TextFormField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Age'),
            ),
            DropdownButtonFormField<String>(
              value: gender,
              items: ['Male', 'Female', 'Other']
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (val) => setState(() => gender = val),
              decoration: InputDecoration(labelText: 'Gender'),
            ),
            DropdownButtonFormField<String>(
              value: location,
              items: ['North', 'South']
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (val) => setState(() => location = val),
              decoration: InputDecoration(labelText: 'Location'),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _saveProfile,
                child: Text('Submit'),
              ),
            ),
            TextButton(
              onPressed: () {
                // Skip without image
                _saveProfile();
              },
              child: Text('Use Without Pic', style: TextStyle(color: Colors.blue)),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'home_page.dart';
//
// class ProfilePage extends StatefulWidget {
//   final String userId;
//   ProfilePage({required this.userId});
//
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }
//
// class _ProfilePageState extends State<ProfilePage> {
//   final TextEditingController firstNameController = TextEditingController();
//   final TextEditingController lastNameController = TextEditingController();
//   final TextEditingController contactController = TextEditingController();
//   final TextEditingController ageController = TextEditingController();
//
//   String? gender;
//   String? location;
//
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//
//   void _saveProfile() async {
//     await _firestore.collection('users').doc(widget.userId).set({
//       'firstName': firstNameController.text,
//       'lastName': lastNameController.text,
//       'contact': contactController.text,
//       'age': ageController.text,
//       'gender': gender,
//       'location': location,
//       'email': FirebaseAuth.instance.currentUser!.email,
//     });
//
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (_) => HomePage()),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile'),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Center(
//                 child: Stack(
//                   alignment: Alignment.bottomRight,
//                   children: [
//                     CircleAvatar(
//                       radius: 50,
//                       backgroundColor: Colors.grey[300],
//                       child: Icon(Icons.person, size: 50, color: Colors.white),
//                     ),
//                     FloatingActionButton(
//                       mini: true,
//                       child: Icon(Icons.add_a_photo),
//                       onPressed: () {
//                         // Handle pick image action
//                       },
//                     )
//                   ],
//                 ),
//               ),
//               SizedBox(height: 20),
//               TextFormField(
//                 controller: firstNameController,
//                 decoration: InputDecoration(labelText: 'First Name'),
//               ),
//               TextFormField(
//                 controller: lastNameController,
//                 decoration: InputDecoration(labelText: 'Last Name'),
//               ),
//               TextFormField(
//                 controller: contactController,
//                 keyboardType: TextInputType.phone,
//                 decoration: InputDecoration(labelText: 'Contact Number'),
//               ),
//               TextFormField(
//                 controller: ageController,
//                 keyboardType: TextInputType.number,
//                 decoration: InputDecoration(labelText: 'Age'),
//               ),
//               DropdownButtonFormField<String>(
//                 value: gender,
//                 items: ['Male', 'Female', 'Other']
//                     .map((e) => DropdownMenuItem(value: e, child: Text(e)))
//                     .toList(),
//                 onChanged: (val) => setState(() => gender = val),
//                 decoration: InputDecoration(labelText: 'Gender'),
//               ),
//               DropdownButtonFormField<String>(
//                 value: location,
//                 items: ['North', 'South']
//                     .map((e) => DropdownMenuItem(value: e, child: Text(e)))
//                     .toList(),
//                 onChanged: (val) => setState(() => location = val),
//                 decoration: InputDecoration(labelText: 'Location'),
//               ),
//               SizedBox(height: 20),
//               Center(
//                 child: ElevatedButton(
//                   onPressed: _saveProfile,
//                   child: Text('Submit'),
//                 ),
//               ),
//               Center(
//                 child: TextButton(
//                   onPressed: _saveProfile,
//                   child: Text('Use Without Pic', style: TextStyle(color: Colors.blue)),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }