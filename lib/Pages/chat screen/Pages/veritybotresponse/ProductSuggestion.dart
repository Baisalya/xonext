import 'package:flutter/material.dart';
import 'package:xonext/utils/Customized/clickabletext.dart';

class ProductSuggestion extends StatelessWidget {
  final String text;

  ProductSuggestion({required this.text});

  @override
  Widget build(BuildContext context) {
    List<String> parts = text.split(', ');
    String productName = parts[0].substring(parts[0].indexOf(':') + 2);
    String price = parts[1].substring(parts[1].indexOf(':') + 2);
    String imageURL = parts[2].substring(parts[2].indexOf(':') + 2);

    return Card(
      elevation: 4, // Add elevation for a shadow effect
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.network(
              imageURL,
              width: double.infinity,
              height: 150,
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: productName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 4.0),
                CustomText(
                  text: 'Price: $price',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(height: 8.0),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle add to cart functionality
                    },
                    child: CustomText(text: 'Add to Cart'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProductSuggestionsGrid extends StatelessWidget {
  final List<String> products;

  ProductSuggestionsGrid({required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Suggestions'),
      ),
      body: GridView.count(
        padding: EdgeInsets.all(10.0),
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        children: products.map((product) {
          return ProductSuggestion(text: product);
        }).toList(),
      ),
    );
  }
}

