import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert'; // For Base64 decoding
import 'dart:typed_data'; // For Uint8List
import 'package:image/image.dart' as img; // For image compression

class MyAdsPage extends StatelessWidget {
  final String userId; // Pass the current user's ID

  MyAdsPage({required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Ads"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('items')
            .where('userId', isEqualTo: userId) // Filter by user ID
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text("No ads posted yet!"));
          }

          final ads = snapshot.data!.docs;

          return ListView.builder(
            itemCount: ads.length,
            itemBuilder: (context, index) {
              final ad = ads[index].data() as Map<String, dynamic>;
              final imageBase64 = ad['imageBase64'] as String;

              return Card(
                margin: EdgeInsets.all(10),
                child: ListTile(
                  contentPadding: EdgeInsets.all(10),
                  leading: FutureBuilder<Uint8List>(
                    future: _decodeAndResizeImage(imageBase64), // Decode and resize image
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Container(
                          width: 80,
                          height: 80,
                          color: Colors.grey[300], // Placeholder while loading
                        );
                      } else if (snapshot.hasError) {
                        return Icon(Icons.error, color: Colors.red); // Error icon
                      } else if (snapshot.hasData) {
                        return Image.memory(
                          snapshot.data!, // Display decoded image
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        );
                      } else {
                        return Icon(Icons.image, color: Colors.grey); // Fallback icon
                      }
                    },
                  ),
                  title: Text(ad['title'], style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text("Price: \$${ad['price']}"),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      _deleteAd(ads[index].id); // Delete the ad
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  // Function to decode Base64 string and resize the image
  Future<Uint8List> _decodeAndResizeImage(String base64String) async {
    try {
      // Decode the Base64 string
      final imageBytes = base64Decode(base64String);

      // Decode the image using the `image` package
      final decodedImage = img.decodeImage(imageBytes);

      // Resize the image to a smaller resolution
      final resizedImage = img.copyResize(decodedImage!, width: 200); // Adjust width as needed

      // Encode the resized image to JPEG
      final resizedImageBytes = img.encodeJpg(resizedImage, quality: 85);

      return resizedImageBytes;
    } catch (e) {
      print('Error decoding or resizing image: $e');
      throw e; // Rethrow the error to handle it in the FutureBuilder
    }
  }

  // Function to delete an ad
  void _deleteAd(String adId) async {
    try {
      await FirebaseFirestore.instance.collection('items').doc(adId).delete();
      print('Ad deleted successfully');
    } catch (e) {
      print('Error deleting ad: $e');
    }
  }
}