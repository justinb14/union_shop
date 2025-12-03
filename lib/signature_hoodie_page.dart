import 'package:flutter/material.dart';
import 'cart_model.dart';

class SignatureHoodiePage extends StatefulWidget {
  const SignatureHoodiePage({super.key});

  @override
  State<SignatureHoodiePage> createState() => _SignatureHoodiePageState();
}

class _SignatureHoodiePageState extends State<SignatureHoodiePage> {
  String _selectedColour = 'Green';
  String _selectedSize = 'M';
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Signature Hoodie')),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Signature Hoodie',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            Center(
              child: Image.asset(
                'assets/images/hoodie_green.png', // Only green allowed
                height: 220,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              '£32.99',
              style: TextStyle(fontSize: 22, color: Color(0xFF4d2963), fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'The Signature Hoodie features premium materials and a unique design. Perfect for showing your university pride.',
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            const SizedBox(height: 24),
            DropdownButtonFormField<String>(
              value: _selectedColour,
              items: const [
                DropdownMenuItem(value: 'Green', child: Text('Green')),
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
                    title: 'Signature Hoodie ($_selectedColour, $_selectedSize)',
                    imageUrl: 'assets/images/hoodie_green.png',
                    price: 32.99,
                    quantity: _quantity,
                  ));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Added $_quantity Signature Hoodie ($_selectedSize, $_selectedColour) to cart!')),
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
