import 'cart_page.dart'; // <-- Move this to the very top, before any other project imports
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// Fix: Use relative import for product_page.dart
import 'product_page.dart';
import 'union_shop_home.dart'; // <-- Add this import for HomeScreen
// Fix: Use relative import for PortsmouthCollectionPage
import 'portsmouth_city/portsmouth_collection_page.dart';
// Fix: Use relative import for sale_page.dart
import 'sale_page.dart';
// Fix: Use relative import for sign_in_page.dart
import 'sign_in_page.dart';
// Fix: Use relative import for footer.dart
import 'footer.dart';
// Fix: Use relative import for product_card.dart
import 'product_card.dart';
import 'cart_model.dart'; // <-- Add this line
import 'personalisation_page.dart'; // Add this import
import 'about_page.dart'; // Add this import
import 'terms_page.dart'; // Add this import
//restored
import 'essential_tshirt_page.dart';
import 'signature_hoodie_page.dart';
import 'signature_tshirt_page.dart';

// --- Common Widgets for AppBar ---
PreferredSizeWidget buildShopAppBar(BuildContext context) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(86),
    child: Material(
      color: Colors.white,
      child: Column(
        children: [
          // Top sale banner
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 6),
            color: const Color(0xFF4d2963),
            child: const Text(
              'BIG SALE! OUR ESSENTIAL RANGE HAS DROPPED IN PRICE! OVER 20% OFF! COME GRAB YOURS WHILE STOCK LASTS!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.w700,
                height: 1.1,
                letterSpacing: 1.2,
              ),
            ),
          ),
          // Navigation row
          SizedBox(
            height: 48,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: _NavBar(context),
            ),
          ),
        ],
      ),
    ),
  );
}

void showProductSearchDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      String query = '';
      List<Map<String, String>> allProducts = [
        // Essential Range
        {'name': 'Essential Hoodie', 'route': '/signature_hoodie', 'image': 'assets/images/hoodie_navy.png', 'price': '£29.99'},
        {'name': 'Essential T-Shirt', 'route': '/essential_tshirt', 'image': 'assets/images/tee.png', 'price': '£6.99'},
        // Signature Range
        {'name': 'Signature Hoodie', 'route': '/signature_hoodie', 'image': 'assets/images/hoodie_green.png', 'price': '£32.99'},
        {'name': 'Signature T-Shirt', 'route': '/signature_tshirt', 'image': 'assets/images/tee_navy.png', 'price': '£9.99'},
        // Portsmouth City Collection
        {'name': 'Portsmouth City Postcard', 'route': '/p_postcard', 'image': 'assets/images/p_postcard.png', 'price': '£6.00'},
        {'name': 'Portsmouth City Bookmark', 'route': '/p_bookmark', 'image': 'assets/images/p_bookmark.png', 'price': '£4.00'},
        {'name': 'Portsmouth City Notebook', 'route': '/p_notebook', 'image': 'assets/images/p_notebook.png', 'price': '£4.00'},
        // Sale Page
        {'name': 'Essential Sweatshirt', 'route': '/sale_sweatshirt', 'image': 'assets/images/sweatshirt.png', 'price': '£21.99'},
        {'name': 'Portsmouth Notebook', 'route': '/sale_notebook', 'image': 'assets/images/ports_notebook.png', 'price': '£4.99'},
        {'name': 'USB Cable', 'route': '/sale_usb', 'image': 'assets/images/usb_cable.png', 'price': '£2.99'},
        {'name': 'Fidget Keyring', 'route': '/sale_fidget', 'image': 'assets/images/fidget_keyring.png', 'price': '£1.99'},
      ];
      List<Map<String, String>> results = allProducts;
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: const Text('Search Products'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  autofocus: true,
                  decoration: const InputDecoration(
                    hintText: 'Type product name...',
                  ),
                  onChanged: (val) {
                    setState(() {
                      query = val;
                      results = allProducts.where((p) =>
                        p['name']!.toLowerCase().contains(query.toLowerCase())
                      ).toList();
                    });
                  },
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 220,
                  width: 350,
                  child: results.isEmpty
                    ? const Center(child: Text('No products found.'))
                    : ListView.builder(
                        itemCount: results.length,
                        itemBuilder: (context, i) {
                          final p = results[i];
                          return ListTile(
                            leading: Image.asset(p['image']!, width: 40, height: 40, fit: BoxFit.cover),
                            title: Text(p['name']!),
                            subtitle: Text(p['price']!),
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.pushNamed(context, p['route']!);
                            },
                          );
                        },
                      ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Close'),
              ),
            ],
          );
        },
      );
    },
  );
}

class _NavBar extends StatelessWidget {
  final BuildContext parentContext;
  const _NavBar(this.parentContext, {super.key});

  void _navigate(String route) {
    if (route == '/') {
      Navigator.pushNamedAndRemoveUntil(parentContext, '/', (route) => false);
    } else {
      Navigator.pushNamed(parentContext, route);
    }
  }

  void _navigateToSignIn(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignInPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => _navigate('/'),
          child: Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Image.network(
              'https://shop.upsu.net/cdn/shop/files/upsu_300x300.png?v=1614735854',
              height: 36,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[300],
                  width: 36,
                  height: 36,
                  child: const Center(
                    child: Icon(Icons.image_not_supported, color: Colors.grey),
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () => _navigate('/'),
                child: const Text('Home', style: TextStyle(color: Colors.black)),
              ),
              const SizedBox(width: 12),
              // --- Shop Dropdown Button ---
              PopupMenuButton<String>(
                onSelected: (value) {
                  // No navigation needed, just show the dropdown
                },
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 'clothing',
                    child: Text('Clothing'),
                  ),
                  const PopupMenuItem(
                    value: 'merch',
                    child: Text('Merchandise'),
                  ),
                  const PopupMenuItem(
                    value: 'sig_ess',
                    child: Text('Signature & Essential Range'),
                  ),
                  const PopupMenuItem(
                    value: 'portsmouth',
                    child: Text('Portsmouth City Collection'),
                  ),
                  const PopupMenuItem(
                    value: 'pride',
                    child: Text('Pride Collection'),
                  ),
                  const PopupMenuItem(
                    value: 'graduation',
                    child: Text('Graduation'),
                  ),
                ],
                child: const Text(
                  'Shop',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                offset: const Offset(0, 40),
                color: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              ),
              const SizedBox(width: 12),
              // --- Replace 'The Print Shack' TextButton with PopupMenuButton ---
              PopupMenuButton<String>(
                onSelected: (value) {
                  if (value == 'who') {
                    Navigator.push(
                      parentContext,
                      MaterialPageRoute(builder: (context) =>  PrintShackWhoAreWePage()),
                    );
                  } else if (value == 'personalisation') {
                    Navigator.push(
                      parentContext,
                      MaterialPageRoute(builder: (context) =>  PrintShackPersonalisationPage()),
                    );
                  }
                },
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 'who',
                    child: Text('Who are we'), // <-- Changed label
                  ),
                  const PopupMenuItem(
                    value: 'personalisation',
                    child: Text('Personalisation'),
                  ),
                ],
                child: const Text(
                  'The Print Shack',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                offset: const Offset(0, 40),
                color: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              ),
              const SizedBox(width: 12),
              TextButton(
                onPressed: () => _navigate('/sale'),
                child: const Text('SALE!', style: TextStyle(color: Colors.black)),
              ),
              const SizedBox(width: 12),
              TextButton(
                onPressed: () => _navigate('/about'),
                child: const Text('About', style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.search, size: 26, color: Colors.black),
                padding: const EdgeInsets.all(14),
                constraints: const BoxConstraints(minWidth: 48, minHeight: 48),
                onPressed: () {
                  showProductSearchDialog(context);
                },
              ),
              // --- Shopping Cart Button (navigates to cart page) ---
              IconButton(
                icon: const Icon(Icons.shopping_cart_outlined, size: 26, color: Colors.black),
                padding: const EdgeInsets.all(14),
                constraints: const BoxConstraints(minWidth: 48, minHeight: 48),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartPage()),
                  );
                },
                tooltip: 'View Cart',
              ),
              IconButton(
                icon: const Icon(Icons.person_outline, size: 26, color: Colors.black),
                padding: const EdgeInsets.all(14),
                constraints: const BoxConstraints(minWidth: 48, minHeight: 48),
                onPressed: () => _navigateToSignIn(context),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// --- Main App ---
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => Cart(),
      child: const UnionShopApp(),
    ),
  );
}

class UnionShopApp extends StatelessWidget {
  const UnionShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Union Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4d2963)),
      ),
      home: const HomeScreen(), // HomeScreen now imported from union_shop_home.dart
      initialRoute: '/',
      routes: {
        '/product': (context) => const ProductPage(), // ProductPage now imported from product_page.dart
        '/portsmouth': (context) => PortsmouthCollectionPage(),
        '/about': (context) =>  AboutPage(),
        '/sale': (context) => const SalePage(),
        '/sale_sweatshirt': (context) => const SaleSweatshirtPage(),
        '/sale_notebook': (context) => const SaleNotebookPage(),
        '/sale_usb': (context) => const SaleUSBPage(),
        '/sale_fidget': (context) => const SaleFidgetPage(),
        '/essential_tshirt': (context) => EssentialTShirtPage(),
        '/signature_hoodie': (context) => SignatureHoodiePage(),
        '/signature_tshirt': (context) => SignatureTShirtPage(),
        '/p_postcard': (context) => PortsmouthCityPostcardPage(),
        '/p_bookmark': (context) => PortsmouthCityBookmarkPage(),
        '/p_notebook': (context) => const PortsmouthCityNotebookPage(),
        '/cart': (context) => CartPage(),
        '/personalisation': (context) =>  PersonalisationPage(), // <-- Add this line
        '/terms': (context) => const TermsPage(), // Add this line
      },
    );
  }
}
