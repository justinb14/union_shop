import 'package:flutter/material.dart';
import 'footer.dart';
import 'cart_model.dart';
import 'main.dart'; // <-- Add this import for buildShopAppBar
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildShopAppBar(context),
      body: Consumer<Cart>(
        builder: (context, cart, child) {
          final items = cart.items;
          if (items.isEmpty) {
            return const Center(
              child: Text(
                'Your cart is empty.',
                style: TextStyle(fontSize: 24, color: Colors.black54),
              ),
            );
          }
          return Padding(
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
                    itemCount: items.length,
                    separatorBuilder: (_, __) => const Divider(),
                    itemBuilder: (context, i) {
                      final item = items[i];
                      return ListTile(
                        leading: item.imageUrl.startsWith('assets/')
                            ? Image.asset(item.imageUrl, width: 56, height: 56, fit: BoxFit.cover)
                            : Image.network(item.imageUrl, width: 56, height: 56, fit: BoxFit.cover),
                        title: Text(item.title, style: const TextStyle(fontSize: 18)),
                        subtitle: Row(
                          children: [
                            Text('£${item.price.toStringAsFixed(2)}'),
                            const SizedBox(width: 12),
                            // Quantity editor
                            SizedBox(
                              width: 60,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                                ),
                                controller: TextEditingController(text: item.quantity.toString()),
                                onChanged: (val) {
                                  final n = int.tryParse(val);
                                  if (n != null && n > 0) {
                                    // Update quantity in cart
                                    item.quantity = n;
                                    Provider.of<Cart>(context, listen: false).notifyListeners();
                                  }
                                },
                              ),
                            ),
                            const SizedBox(width: 8),
                            // Remove button
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              tooltip: 'Remove',
                              onPressed: () {
                                Provider.of<Cart>(context, listen: false).removeItem(item);
                                Provider.of<Cart>(context, listen: false).notifyListeners();
                              },
                            ),
                          ],
                        ),
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
                        cart.clear();
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
          );
        },
      ),
      bottomNavigationBar: buildShopFooter(context),
    );
  }
}
