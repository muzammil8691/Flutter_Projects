import 'package:flutter/material.dart';

class Marketplace extends StatelessWidget {
  const Marketplace({super.key});

  @override
  Widget build(BuildContext context) {
    // Placeholder data for items
    final List<Map<String, String>> items = [
      {"image": "assets/photo1.jpg", "title": "Item 1", "price": "\$20"},
      {"image": "assets/photo2.jpg", "title": "Item 2", "price": "\$45"},
      {"image": "assets/photo3.jpg", "title": "Item 3", "price": "\$30"},
      {"image": "assets/photo4.jpg", "title": "Item 4", "price": "\$70"},
      {"image": "assets/photo5.jpg", "title": "Item 5", "price": "\$15"},
      {"image": "assets/photo6.jpg", "title": "Item 6", "price": "\$90"},
      {"image": "assets/photo7.jpg", "title": "Item 7", "price": "\$50"},
      {"image": "assets/photo8.jpg", "title": "Item 8", "price": "\$35"},
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Two items per row
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 3 / 4, // Adjust item height
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Item image
                  Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(10),
                      ),
                      image: DecorationImage(
                        image: AssetImage(items[index]["image"]!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Item title
                        Text(
                          items[index]["title"]!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 5),
                        // Item price
                        Text(
                          items[index]["price"]!,
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
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
