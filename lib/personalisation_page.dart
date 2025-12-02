import 'package:flutter/material.dart';
import 'footer.dart';
import 'cart_model.dart';

class PersonalisationPage extends StatelessWidget {
  const PersonalisationPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildShopAppBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'The Union Print Shack', // <-- Changed heading
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(height: 32),
              const Text(
                "Make It Yours at The Union Print Shack\n\n"
                "Want to add a personal touch? We’ve got you covered with heat-pressed customisation on all our clothing. Swing by the shop - our team’s always happy to help you pick the right gear and answer any questions.\n\n"
                "Uni Gear or Your Gear - We’ll Personalise It\n"
                "Whether you’re repping your university or putting your own spin on a hoodie you already own, we’ve got you covered. We can personalise official uni-branded clothing and your own items - just bring them in and let’s get creative!\n\n"
                "Simple Pricing, No Surprises\n"
                "Customising your gear won’t break the bank - just £3 for one line of text or a small chest logo, and £5 for two lines or a large back logo. Turnaround time is up to three working days, and we’ll let you know as soon as it’s ready to collect.\n\n"
                "Personalisation Terms & Conditions\n"
                "We will print your clothing exactly as you have provided it to us, whether online or in person. We are not responsible for any spelling errors. Please ensure your chosen text is clearly displayed in either capitals or lowercase. Refunds are not provided for any personalised items.\n\n"
                "Ready to Make It Yours?\n"
                "Pop in or get in touch today - let’s create something uniquely you with our personalisation service - The Union Print Shack!",
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.black87,
                  height: 1.6,
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: buildShopFooter(context),
    );
  }
}

class PrintShackWhoAreWePage extends StatelessWidget {
  const PrintShackWhoAreWePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildShopAppBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'The Union Print Shack', // <-- Title
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // --- Add images below title ---
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/print_shack_hoodie.png',
                    height: 120,
                  ),
                  const SizedBox(width: 32),
                  Image.asset(
                    'assets/images/union_logo.png',
                    height: 120,
                  ),
                ],
              ),
              const SizedBox(height: 32),
              const Text(
                "Make It Yours at The Union Print Shack\n"
                "Want to add a personal touch? We’ve got you covered with heat-pressed customisation on all our clothing. Swing by the shop - our team’s always happy to help you pick the right gear and answer any questions.\n\n"
                "Uni Gear or Your Gear - We’ll Personalise It\n"
                "Whether you’re repping your university or putting your own spin on a hoodie you already own, we’ve got you covered. We can personalise official uni-branded clothing and your own items - just bring them in and let’s get creative!\n\n"
                "Simple Pricing, No Surprises\n"
                "Customising your gear won’t break the bank - just £3 for one line of text or a small chest logo, and £5 for two lines or a large back logo. Turnaround time is up to three working days, and we’ll let you know as soon as it’s ready to collect.\n\n"
                "Personalisation Terms & Conditions\n"
                "We will print your clothing exactly as you have provided it to us, whether online or in person. We are not responsible for any spelling errors. Please ensure your chosen text is clearly displayed in either capitals or lowercase. Refunds are not provided for any personalised items.\n\n"
                "Ready to Make It Yours?\n"
                "Pop in or get in touch today - let’s create something uniquely you with our personalisation service - The Union Print Shack!",
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.black87,
                  height: 1.6,
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: buildShopFooter(context),
    );
  }
}

class PrintShackPersonalisationPage extends StatefulWidget {
  const PrintShackPersonalisationPage({super.key});

  @override
  State<PrintShackPersonalisationPage> createState() => _PrintShackPersonalisationPageState();
}

class _PrintShackPersonalisationPageState extends State<PrintShackPersonalisationPage> {
  String _selectedOption = 'One line of text';
  double _price = 3.0;
  int _quantity = 1;
  final TextEditingController _personalisationController1 = TextEditingController();
  final TextEditingController _personalisationController2 = TextEditingController();
  final TextEditingController _personalisationController3 = TextEditingController();
  final TextEditingController _quantityController = TextEditingController(text: '1');

  @override
  void dispose() {
    _personalisationController1.dispose();
    _personalisationController2.dispose();
    _personalisationController3.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  void _updatePrice(String option) {
    setState(() {
      _selectedOption = option;
      if (option == 'One line of text') {
        _price = 3.0;
      } else if (option == 'Two lines of Text') {
        _price = 5.0;
      } else if (option == 'Three lines of text') {
        _price = 7.5;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 800;
    return Scaffold(
      appBar: buildShopAppBar(context),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 32),
            child: Flex(
              direction: isWide ? Axis.horizontal : Axis.vertical,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image on left
                SizedBox(
                  width: isWide ? 320 : double.infinity,
                  height: isWide ? 320 : 180,
                  child: Image.asset(
                    'assets/images/print_shack_hoodie.png',
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(width: isWide ? 48 : 0, height: isWide ? 0 : 32),
                // Content on right
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Personalisation',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        '£${_price.toStringAsFixed(_price == _price.roundToDouble() ? 0 : 2)}',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4d2963),
                        ),
                      ),
                      const SizedBox(height: 24),
                      DropdownButtonFormField<String>(
                        value: _selectedOption,
                        items: const [
                          DropdownMenuItem(
                            value: 'One line of text',
                            child: Text('One line of text'),
                          ),
                          DropdownMenuItem(
                            value: 'Two lines of Text',
                            child: Text('Two lines of Text'),
                          ),
                          DropdownMenuItem(
                            value: 'Three lines of text',
                            child: Text('Three lines of text'),
                          ),
                        ],
                        onChanged: (val) {
                          if (val != null) _updatePrice(val);
                        },
                        decoration: InputDecoration(
                          labelText: 'Personalisation Type',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        ),
                      ),
                      const SizedBox(height: 24),
                      // First line textbox (always shown)
                      TextField(
                        controller: _personalisationController1,
                        decoration: const InputDecoration(
                          labelText: 'Personalisation Line 1',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                        ),
                      ),
                      // Second line textbox (shown for two/three lines)
                      if (_selectedOption == 'Two lines of Text' || _selectedOption == 'Three lines of text') ...[
                        const SizedBox(height: 16),
                        TextField(
                          controller: _personalisationController2,
                          decoration: const InputDecoration(
                            labelText: 'Personalisation Line 2',
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                          ),
                        ),
                      ],
                      // Third line textbox (shown for three lines)
                      if (_selectedOption == 'Three lines of text') ...[
                        const SizedBox(height: 16),
                        TextField(
                          controller: _personalisationController3,
                          decoration: const InputDecoration(
                            labelText: 'Personalisation Line 3',
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                          ),
                        ),
                      ],
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          const Text(
                            'Quantity',
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                          ),
                          const SizedBox(width: 16),
                          SizedBox(
                            width: 60,
                            child: TextField(
                              controller: _quantityController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                              ),
                              onChanged: (val) {
                                final n = int.tryParse(val);
                                if (n != null && n > 0) {
                                  setState(() => _quantity = n);
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      ElevatedButton(
                        onPressed: () {
                          Cart().addItem(CartItem(
                            title: 'Personalisation (${_selectedOption})',
                            imageUrl: 'assets/images/print_shack_hoodie.png',
                            price: _price,
                            quantity: _quantity,
                          ));
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Added to cart!')),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4d2963),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
                        ),
                        child: const Text(
                          'Add to Cart',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: buildShopFooter(context),
    );
  }
}