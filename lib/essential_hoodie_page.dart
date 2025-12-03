import 'package:flutter/material.dart';
import 'cart_model.dart';

class EssentialHoodiePage extends StatefulWidget {
  const EssentialHoodiePage({super.key});

  @override
  State<EssentialHoodiePage> createState() => _EssentialHoodiePageState();
}

class _EssentialHoodiePageState extends State<EssentialHoodiePage> {
  String _selectedColour = 'Navy';
  String _selectedSize = 'M';
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Essential Hoodie')),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Essential Hoodie',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            Center(
              child: Image.asset(
                _selectedColour == 'Navy'
                  ? 'assets/images/hoodie_navy.png'
                  : 'assets/images/hoodie_white.png',
                height: 220,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              '£29.99',
              style: TextStyle(fontSize: 22, color: Color(0xFF4d2963), fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Our Essential Hoodie is perfect for everyday comfort. Made from soft cotton blend, it features a classic fit and durable print.',
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            const SizedBox(height: 24),
            DropdownButtonFormField<String>(
              value: _selectedColour,
              items: const [
                DropdownMenuItem(value: 'Navy', child: Text('Navy')),
                DropdownMenuItem(value: 'White', child: Text('White')),
              ],
              onChanged: (val) {
                if (val != null) setState(() => _selectedColour = val);
              },
              decoration: const InputDecoration(
                labelText: 'Colour',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              ),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _selectedSize,
              items: const [
                DropdownMenuItem(value: 'S', child: Text('Small')),
                DropdownMenuItem(value: 'M', child: Text('Medium')),
                DropdownMenuItem(value: 'L', child: Text('Large')),
              ],
              onChanged: (val) {
                if (val != null) setState(() => _selectedSize = val);
              },
              decoration: const InputDecoration(
                labelText: 'Size',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              ),
            ),
            const SizedBox(height: 16),
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
                    title: 'Essential Hoodie ($_selectedColour, $_selectedSize)',
                    imageUrl: _selectedColour == 'Navy'
                      ? 'assets/images/hoodie_navy.png'
                      : 'assets/images/hoodie_white.png',
                    price: 29.99,
                    quantity: _quantity,
                  ));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Added $_quantity x $_selectedColour Essential Hoodie ($_selectedSize) to cart!')),
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
