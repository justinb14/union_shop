import 'package:flutter/material.dart';
import 'footer.dart';
import 'product_card.dart';
import 'main.dart'; // for buildShopAppBar

// Simple Product class for demonstration
class Product {
  final String title;
  final String imageUrl;
  Product({required this.title, required this.imageUrl});
}

// Cart state using ValueNotifier for simplicity
final ValueNotifier<List<Product>> cart = ValueNotifier<List<Product>>([]);

// Cart Page
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        backgroundColor: const Color(0xFF4d2963),
      ),
      body: ValueListenableBuilder<List<Product>>(
        valueListenable: cart,
        builder: (context, items, _) {
          if (items.isEmpty) {
            return const Center(child: Text('Your cart is empty.'));
          }
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, idx) {
              final product = items[idx];
              return ListTile(
                leading: Image.network(product.imageUrl, width: 50, height: 50, fit: BoxFit.cover),
                title: Text(product.title),
                trailing: IconButton(
                  icon: const Icon(Icons.remove_circle_outline),
                  onPressed: () {
                    cart.value = List.from(cart.value)..removeAt(idx);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Union Shop'),
        backgroundColor: const Color(0xFF4d2963),
        actions: [
          ValueListenableBuilder<List<Product>>(
            valueListenable: cart,
            builder: (context, items, _) => Stack(
              alignment: Alignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const CartPage()),
                    );
                  },
                ),
                if (items.isNotEmpty)
                  Positioned(
                    right: 8,
                    top: 8,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
                      child: Text(
                        '${items.length}',
                        style: const TextStyle(color: Colors.white, fontSize: 10),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _SectionCard(
            title: 'Essential Range',
            imageUrl: 'https://shop.upsu.net/cdn/shop/files/essential_range.jpg?v=1',
            onTap: () {
              // Navigate or show details for Essential Range
            },
          ),
          const SizedBox(height: 24),
          _SectionCard(
            title: 'Signature Range',
            imageUrl: 'https://shop.upsu.net/cdn/shop/files/signature_range.jpg?v=1',
            onTap: () {
              // Navigate or show details for Signature Range
            },
          ),
          const SizedBox(height: 24),
          _SectionCard(
            title: 'Portsmouth City Collection',
            imageUrl: 'https://shop.upsu.net/cdn/shop/files/portsmouth_city.jpg?v=1',
            onTap: () {
              Navigator.pushNamed(context, '/portsmouth');
            },
          ),
          const Footer(),
        ],
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final VoidCallback onTap;

  const _SectionCard({
    required this.title,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(
                imageUrl,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 180,
                  color: Colors.grey[300],
                  child: const Center(child: Icon(Icons.image, size: 48, color: Colors.grey)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.add_shopping_cart),
                    label: const Text('Add to Cart'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4d2963),
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      cart.value = List.from(cart.value)
                        ..add(Product(title: title, imageUrl: imageUrl));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('$title added to cart')),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
