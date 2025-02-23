import 'package:flutter/material.dart';

class ItemSellerInfoPage extends StatelessWidget {
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
                    child: Image.network(
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
                    "Item Description: This is a great item available for sale. It is in excellent condition.avdgashfajfjashfhjadgfhahgfgefiywggfhgjhsfgwkefuiwgfwgfgiuwefthdjfsnmfvdvfhjschvshdvhfvhdsvhfdbsbfbma,gf,agehfbanmfb,ahegf.ahfuGgefjgdhfsyfoiagfagfeu,hfajfjashfhjadgfhahgfgefiywggfhgjhsfgwkefuiwgfwgfgiuwefthdjfsnmfvdvfhjschvshdvhfvhdsvhfdbsbfbma,gf,agehfbanmfb,ahegf.ahfuGgefjgdhfsyfoiagfagfeuhfajfjashfhjadgfhahgfgefiywggfhgjhsfgwkefuiwgfwgfgiuwefthdjfsnmfvdvfhjschvshdvhfvhdsvhfdbsbfbma,gf,agehfbanmfb,ahegf.ahfuGgefjgdhfsyfoiagfagfeuhfajfjashfhjadgfhahgfgefiywggfhgjhsfgwkefuiwgfwgfgiuwefthdjfsnmfvdvfhjschvshdvhfvhdsvhfdbsbfbma,gf,agehfbanmfb,ahegf.ahfuGgefjgdhfsyfoiagfagfeuhfajfjashfhjadgfhahgfgefiywggfhgjhsfgwkefuiwgfwgfgiuwefthdjfsnmfvdvfhjschvshdvhfvhdsvhfdbsbfbma,gf,agehfbanmfb,ahegf.ahfuGgefjgdhfsyfoiagfagfeuhfajfjashfhjadgfhahgfgefiywggfhgjhsfgwkefuiwgfwgfgiuwefthdjfsnmfvdvfhjschvshdvhfvhdsvhfdbsbfbma,gf,agehfbanmfb,ahegf.ahfuGgefjgdhfsyfoiagfagfeuhfajfjashfhjadgfhahgfgefiywggfhgjhsfgwkefuiwgfwgfgiuwefthdjfsnmfvdvfhjschvshdvhfvhdsvhfdbsbfbma,gf,agehfbanmfb,ahegf.ahfuGgefjgdhfsyfoiagfagfeuhfajfjashfhjadgfhahgfgefiywggfhgjhsfgwkefuiwgfwgfgiuwefthdjfsnmfvdvfhjschvshdvhfvhdsvhfdbsbfbma,gf,agehfbanmfb,ahegf.ahfuGgefjgdhfsyfoiagfagfeuhfajfjashfhjadgfhahgfgefiywggfhgjhsfgwkefuiwgfwgfgiuwefthdjfsnmfvdvfhjschvshdvhfvhdsvhfdbsbfbma,gf,agehfbanmfb,ahegf.ahfuGgefjgdhfsyfoiagfagfeuhfajfjashfhjadgfhahgfgefiywggfhgjhsfgwkefuiwgfwgfgiuwefthdjfsnmfvdvfhjschvshdvhfvhdsvhfdbsbfbma,gf,agehfbanmfb,ahegf.ahfuGgefjgdhfsyfoiagfagfeuhfajfjashfhjadgfhahgfgefiywggfhgjhsfgwkefuiwgfwgfgiuwefthdjfsnmfvdvfhjschvshdvhfvhdsvhfdbsbfbma,gf,agehfbanmfb,ahegf.ahfuGgefjgdhfsyfoiagfagfeuhfajfjashfhjadgfhahgfgefiywggfhgjhsfgwkefuiwgfwgfgiuwefthdjfsnmfvdvfhjschvshdvhfvhdsvhfdbsbfbma,gf,agehfbanmfb,ahegf.ahfuGgefjgdhfsyfoiagfagfeuhfajfjashfhjadgfhahgfgefiywggfhgjhsfgwkefuiwgfwgfgiuwefthdjfsnmfvdvfhjschvshdvhfvhdsvhfdbsbfbma,gf,agehfbanmfb,ahegf.ahfuGgefjgdhfsyfoiagfagfeuhfajfjashfhjadgfhahgfgefiywggfhgjhsfgwkefuiwgfwgfgiuwefthdjfsnmfvdvfhjschvshdvhfvhdsvhfdbsbfbma,gf,agehfbanmfb,ahegf.ahfuGgefjgdhfsyfoiagfagfeuhfajfjashfhjadgfhahgfgefiywggfhgjhsfgwkefuiwgfwgfgiuwefthdjfsnmfvdvfhjschvshdvhfvhdsvhfdbsbfbma,gf,agehfbanmfb,ahegf.ahfuGgefjgdhfsyfoiagfagfeuhfajfjashfhjadgfhahgfgefiywggfhgjhsfgwkefuiwgfwgfgiuwefthdjfsnmfvdvfhjschvshdvhfvhdsvhfdbsbfbma,gf,agehfbanmfb,ahegf.ahfuGgefjgdhfsyfoiagfagfeuhfajfjashfhjadgfhahgfgefiywggfhgjhsfgwkefuiwgfwgfgiuwefthdjfsnmfvdvfhjschvshdvhfvhdsvhfdbsbfbma,gf,agehfbanmfb,ahegf.ahfuGgefjgdhfsyfoiagfagfeuhfajfjashfhjadgfhahgfgefiywggfhgjhsfgwkefuiwgfwgfgiuwefthdjfsnmfvdvfhjschvshdvhfvhdsvhfdbsbfbma,gf,agehfbanmfb,ahegf.ahfuGgefjgdhfsyfoiagfagfeuhfajfjashfhjadgfhahgfgefiywggfhgjhsfgwkefuiwgfwgfgiuwefthdjfsnmfvdvfhjschvshdvhfvhdsvhfdbsbfbma,gf,agehfbanmfb,ahegf.ahfuGgefjgdhfsyfoiagfagfeuhfajfjashfhjadgfhahgfgefiywggfhgjhsfgwkefuiwgfwgfgiuwefthdjfsnmfvdvfhjschvshdvhfvhdsvhfdbsbfbma,gf,agehfbanmfb,ahegf.ahfuGgefjgdhfsyfoiagfagfeuhfajfjashfhjadgfhahgfgefiywggfhgjhsfgwkefuiwgfwgfgiuwefthdjfsnmfvdvfhjschvshdvhfvhdsvhfdbsbfbma,gf,agehfbanmfb,ahegf.ahfuGgefjgdhfsyfoiagfagfeuhfajfjashfhjadgfhahgfgefiywggfhgjhsfgwkefuiwgfwgfgiuwefthdjfsnmfvdvfhjschvshdvhfvhdsvhfdbsbfbma,gf,agehfbanmfb,ahegf.ahfuGgefjgdhfsyfoiagfagfeuhfajfjashfhjadgfhahgfgefiywggfhgjhsfgwkefuiwgfwgfgiuwefthdjfsnmfvdvfhjschvshdvhfvhdsvhfdbsbfbma,gf,agehfbanmfb,ahegf.ahfuGgefjgdhfsyfoiagfagfeuhfajfjashfhjadgfhahgfgefiywggfhgjhsfgwkefuiwgfwgfgiuwefthdjfsnmfvdvfhjschvshdvhfvhdsvhfdbsbfbma,gf,agehfbanmfb,ahegf.ahfuGgefjgdhfsyfoiagfagfeuhfajfjashfhjadgfhahgfgefiywggfhgjhsfgwkefuiwgfwgfgiuwefthdjfsnmfvdvfhjschvshdvhfvhdsvhfdbsbfbma,gf,agehfbanmfb,ahegf.ahfuGgefjgdhfsyfoiagfagfeuhfajfjashfhjadgfhahgfgefiywggfhgjhsfgwkefuiwgfwgfgiuwefthdjfsnmfvdvfhjschvshdvhfvhdsvhfdbsbfbma,gf,agehfbanmfb,ahegf.ahfuGgefjgdhfsyfoiagfagfeuhfajfjashfhjadgfhahgfgefiywggfhgjhsfgwkefuiwgfwgfgiuwefthdjfsnmfvdvfhjschvshdvhfvhdsvhfdbsbfbma,gf,agehfbanmfb,ahegf.ahfuGgefjgdhfsyfoiagfagfeuhfajfjashfhjadgfhahgfgefiywggfhgjhsfgwkefuiwgfwgfgiuwefthdjfsnmfvdvfhjschvshdvhfvhdsvhfdbsbfbma,gf,agehfbanmfb,ahegf.ahfuGgefjgdhfsyfoiagfagfeuhfajfjashfhjadgfhahgfgefiywggfhgjhsfgwkefuiwgfwgfgiuwefthdjfsnmfvdvfhjschvshdvhfvhdsvhfdbsbfbma,gf,agehfbanmfb,ahegf.ahfuGgefjgdhfsyfoiagfagfeuhfajfjashfhjadgfhahgfgefiywggfhgjhsfgwkefuiwgfwgfgiuwefthdjfsnmfvdvfhjschvshdvhfvhdsvhfdbsbfbma,gf,agehfbanmfb,ahegf.ahfuGgefjgdhfsyfoiagfagfeuhfajfjashfhjadgfhahgfgefiywggfhgjhsfgwkefuiwgfwgfgiuwefthdjfsnmfvdvfhjschvshdvhfvhdsvhfdbsbfbma,gf,agehfbanmfb,ahegf.ahfuGgefjgdhfsyfoiagfagfeuhfajfjashfhjadgfhahgfgefiywggfhgjhsfgwkefuiwgfwgfgiuwefthdjfsnmfvdvfhjschvshdvhfvhdsvhfdbsbfbma,gf,agehfbanmfb,ahegf.ahfuGgefjgdhfsyfoiagfagfeuhfajfjashfhjadgfhahgfgefiywggfhgjhsfgwkefuiwgfwgfgiuwefthdjfsnmfvdvfhjschvshdvhfvhdsvhfdbsbfbma,gf,agehfbanmfb,ahegf.ahfuGgefjgdhfsyfoiagfagfeuhfajfjashfhjadgfhahgfgefiywggfhgjhsfgwkefuiwgfwgfgiuwefthdjfsnmfvdvfhjschvshdvhfvhdsvhfdbsbfbma,gf,agehfbanmfb,ahegf.ahfuGgefjgdhfsyfoiagfagfeuhfajfjashfhjadgfhahgfgefiywggfhgjhsfgwkefuiwgfwgfgiuwefthdjfsnmfvdvfhjschvshdvhfvhdsvhfdbsbfbma,gf,agehfbanmfb,ahegf.ahfuGgefjgdhfsyfoiagfagfeuhfajfjashfhjadgfhahgfgefiywggfhgjhsfgwkefuiwgfwgfgiuwefthdjfsnmfvdvfhjschvshdvhfvhdsvhfdbsbfbma,gf,agehfbanmfb,ahegf.ahfuGgefjgdhfsyfoiagfagfeuhfajfjashfhjadgfhahgfgefiywggfhgjhsfgwkefuiwgfwgfgiuwefthdjfsnmfvdvfhjschvshdvhfvhdsvhfdbsbfbma,gf,agehfbanmfb,ahegf.ahfuGgefjgdhfsyfoiagfagfeuhfajfjashfhjadgfhahgfgefiywggfhgjhsfgwkefuiwgfwgfgiuwefthdjfsnmfvdvfhjschvshdvhfvhdsvhfdbsbfbma,gf,agehfbanmfb,ahegf.ahfuGgefjgdhfsyfoiagfagfeuhfajfjashfhjadgfhahgfgefiywggfhgjhsfgwkefuiwgfwgfgiuwefthdjfsnmfvdvfhjschvshdvhfvhdsvhfdbsbfbma,gf,agehfbanmfb,ahegf.ahfuGgefjgdhfsyfoiagfagfeuhfajfjashfhjadgfhahgfgefiywggfhgjhsfgwkefuiwgfwgfgiuwefthdjfsnmfvdvfhjschvshdvhfvhdsvhfdbsbfbma,gf,agehfbanmfb,ahegf.ahfuGgefjgdhfsyfoiagfagfeuhfajfjashfhjadgfhahgfgefiywggfhgjhsfgwkefuiwgfwgfgiuwefthdjfsnmfvdvfhjschvshdvhfvhdsvhfdbsbfbma,gf,agehfbanmfb,ahegf.ahfuGgefjgdhfsyfoiagfagfeuhfajfjashfhjadgfhahgfgefiywggfhgjhsfgwkefuiwgfwgfgiuwefthdjfsnmfvdvfhjschvshdvhfvhdsvhfdbsbfbma,gf,agehfbanmfb,ahegf.ahfuGgefjgdhfsyfoiagfagfeuhfajfjashfhjadgfhahgfgefiywggfhgjhsfgwkefuiwgfwgfgiuwefthdjfsnmfvdvfhjschvshdvhfvhdsvhfdbsbfbma,gf,agehfbanmfb,ahegf.ahfuGgefjgdhfsyfoiagfagfeuhfajfjashfhjadgfhahgfgefiywggfhgjhsfgwkefuiwgfwgfgiuwefthdjfsnmfvdvfhjschvshdvhfvhdsvhfdbsbfbma,gf,agehfbanmfb,ahegf.ahfuGgefjgdhfsyfoiagfagfeuhfajfjashfhjadgfhahgfgefiywggfhgjhsfgwkefuiwgfwgfgiuwefthdjfsnmfvdvfhjschvshdvhfvhdsvhfdbsbfbma,gf,agehfbanmfb,ahegf.ahfuGgefjgdhfsyfoiagfagfeuhfajfjashfhjadgfhahgfgefiywggfhgjhsfgwkefuiwgfwgfgiuwefthdjfsnmfvdvfhjschvshdvhfvhdsvhfdbsbfbma,gf,agehfbanmfb,ahegf.ahfuGgefjgdhfsyfoiagfagfeuhfajfjashfhjadgfhahgfgefiywggfhgjhsfgwkefuiwgfwgfgiuwefthdjfsnmfvdvfhjschvshdvhfvhdsvhfdbsbfbma,gf,agehfbanmfb,ahegf.ahfuGgefjgdhfsyfoiagfagfeuhfajfjashfhjadgfhahgfgefiywggfhgjhsfgwkefuiwgfwgfgiuwefthdjfsnmfvdvfhjschvshdvhfvhdsvhfdbsbfbma,gf,agehfbanmfb,ahegf.ahfuGgefjgdhfsyfoiagfagfeuhfajfjashfhjadgfhahgfgefiywggfhgjhsfgwkefuiwgfwgfgiuwefthdjfsnmfvdvfhjschvshdvhfvhdsvhfdbsbfbma,gf,agehfbanmfb,ahegf.ahfuGgefjgdhfsyfoiagfagfeuhfajfjashfhjadgfhahgfgefiywggfhgjhsfgwkefuiwgfwgfgiuwefthdjfsnmfvdvfhjschvshdvhfvhdsvhfdbsbfbma,gf,agehfbanmfb,ahegf.ahfuGgefjgdhfsyfoiagfagfeuhfajfjashfhjadgfhahgfgefiywggfhgjhsfgwkefuiwgfwgfgiuwefthdjfsnmfvdvfhjschvshdvhfvhdsvhfdbsbfbma,gf,agehfbanmfb,ahegf.ahfuGgefjgdhfsyfoiagfagfeu",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),

                  // Item Price
                  Text(
                    "Price: \$150",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                  SizedBox(height: 16),

                  // Seller Address
                  Text(
                    "Seller Address: 123, Main Street, City, Country",
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

