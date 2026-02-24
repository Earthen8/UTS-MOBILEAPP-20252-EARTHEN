import 'package:flutter/material.dart';
import 'profile_screen.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  void handleBuy(BuildContext context, String itemName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Purchased $itemName'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void navigateToProfile(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProfileScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> products = [
      {'name': 'Shoe', 'desc': 'Comfortable walking shoes'},
      {'name': 'T-Shirt', 'desc': '100% cotton'},
      {'name': 'Headphones', 'desc': 'Noise-canceling'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products', style: TextStyle(color: Colors.white)),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.pinkAccent],
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person, color: Colors.white),
            onPressed: () => navigateToProfile(context),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: const LinearGradient(
                  colors: [Colors.purpleAccent, Colors.pinkAccent],
                ),
              ),
              child: ListTile(
                leading: const Icon(Icons.shopping_bag, color: Colors.white),
                title: Text(
                  product['name']!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  product['desc']!,
                  style: const TextStyle(color: Colors.white70),
                ),
                trailing: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () => handleBuy(context, product['name']!),
                  child: const Text('Buy'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
