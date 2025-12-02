import 'package:flutter/material.dart';
import 'main.dart'; // <-- Add this import for buildShopAppBar
import 'cart_model.dart'; // Add this import for Cart
import 'footer.dart';     // Add this import for buildShopFooter

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cart = Cart();
    return Scaffold(
      appBar: buildShopAppBar(context),
      body: cart.items.isEmpty
          ? const Center(
              child: Text(
                'Your cart is empty.',
                style: TextStyle(fontSize: 24, color: Colors.black54),
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Your Cart',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 24),
                  Expanded(
                    child: ListView.separated(
                      itemCount: cart.items.length,
                      separatorBuilder: (_, __) => const Divider(),
                      itemBuilder: (context, i) {
                        final item = cart.items[i];
                        return ListTile(
                          leading: item.imageUrl.startsWith('assets/')
                              ? Image.asset(item.imageUrl, width: 56, height: 56, fit: BoxFit.cover)
                              : Image.network(item.imageUrl, width: 56, height: 56, fit: BoxFit.cover),
                          title: Text(item.title, style: const TextStyle(fontSize: 18)),
                          subtitle: Text('£${item.price.toStringAsFixed(2)} x ${item.quantity}'),
                          trailing: Text(
                            '£${(item.price * item.quantity).toStringAsFixed(2)}',
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Total: £${cart.totalPrice.toStringAsFixed(2)}',
                        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF4d2963)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            cart.clear();
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[300],
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                        ),
                        child: const Text('Clear Cart'),
                      ),
                      const SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Checkout not implemented.')),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4d2963),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                        ),
                        child: const Text('Checkout'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
      bottomNavigationBar: buildShopFooter(context),
    );
  }
}
