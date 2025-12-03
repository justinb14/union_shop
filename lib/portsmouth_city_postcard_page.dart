import 'package:flutter/material.dart';
import 'cart_model.dart';

class PortsmouthCityPostcardPage extends StatefulWidget {
  const PortsmouthCityPostcardPage({super.key});

  @override
  State<PortsmouthCityPostcardPage> createState() => _PortsmouthCityPostcardPageState();
}

class _PortsmouthCityPostcardPageState extends State<PortsmouthCityPostcardPage> {
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Portsmouth City Postcard')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Portsmouth City Postcard',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              Center(
                child: Image.asset(
                  'assets/images/p_postcard.png',
                  height: 220,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                '£6.00',
                style: TextStyle(fontSize: 22, color: Color(0xFF4d2963), fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                'A beautiful Portsmouth City Postcard, perfect for sending or collecting.',
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
                      title: 'Portsmouth City Postcard',
                      imageUrl: 'assets/images/p_postcard.png',
                      price: 6.00,
                      quantity: _quantity,
                    ));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Added $_quantity Portsmouth City Postcard to cart!')),
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
      ),
    );
  }
}
