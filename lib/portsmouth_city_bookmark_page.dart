import 'package:flutter/material.dart';
import 'cart_model.dart';

class PortsmouthCityBookmarkPage extends StatefulWidget {
  const PortsmouthCityBookmarkPage({super.key});

  @override
  State<PortsmouthCityBookmarkPage> createState() => _PortsmouthCityBookmarkPageState();
}

class _PortsmouthCityBookmarkPageState extends State<PortsmouthCityBookmarkPage> {
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Portsmouth City Bookmark')),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Portsmouth City Bookmark',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            Center(
              child: Image.asset(
                'assets/images/p_bookmark.png',
                height: 220,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              '£4.00',
              style: TextStyle(fontSize: 22, color: Color(0xFF4d2963), fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'A stylish Portsmouth City Bookmark for your reading adventures.',
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                const Text('Quantity', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                const SizedBox(width: 16),
                SizedBox(
                  width: 60,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    ),
                    controller: TextEditingController(text: _quantity.toString()),
                    onChanged: (val) {
                      final n = int.tryParse(val);
                      if (n != null && n > 0) setState(() => _quantity = n);
                    },
                  ),
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Cart().addItem(CartItem(
                    title: 'Portsmouth City Bookmark',
                    imageUrl: 'assets/images/p_bookmark.png',
                    price: 4.00,
                    quantity: _quantity,
                  ));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Added $_quantity Portsmouth City Bookmark to cart!')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4d2963),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                ),
                child: const Text('Add to Cart', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
