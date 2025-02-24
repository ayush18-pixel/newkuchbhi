import 'dart:convert';

import 'package:flutter/material.dart';

class ItemSellerInfoPage extends StatelessWidget {
  final Map<String, dynamic> itemData;

  const ItemSellerInfoPage({required this.itemData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Item and Seller Info"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Item Image
                  Center(
                    child: itemData['imageBase64'] != null
                        ? Image.memory(
                      base64Decode(itemData['imageBase64']),
                      height: constraints.maxWidth * 0.5,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    )
                        : Image.network(
                      'https://via.placeholder.com/300',
                      height: constraints.maxWidth * 0.5,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 16),

                  // Seller Info
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage:
                        NetworkImage('https://via.placeholder.com/100'),
                      ),
                      SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Seller Name",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          Row(
                            children: List.generate(
                                5,
                                    (index) => Icon(Icons.star,
                                    color: Colors.amber, size: 18)),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16),

                  // Item Description
                  Text(
                    "Item Description: ${itemData['description1'] ?? 'N/A'}",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),

                  // Item Price
                  Text(
                    "Price: \$${itemData['price'] ?? 'N/A'}",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                  SizedBox(height: 16),

                  // Seller Address
                  Text(
                    "Location: ${itemData['location'] ?? 'N/A'}",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),

                  // Chat Button above Navigation
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).padding.bottom),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text("Chat with Seller",
                            style: TextStyle(fontSize: 18)),
                      ),
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