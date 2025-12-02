import 'cart_page.dart'; // <-- Move this to the very top, before any other project imports
import 'package:flutter/material.dart';
// Fix: Use relative import for product_page.dart
import 'product_page.dart';
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
              TextButton(
                onPressed: () => _navigate('/product'),
                child: const Text('Shop', style: TextStyle(color: Colors.black)),
              ),
              const SizedBox(width: 12),
              TextButton(
                onPressed: () {},
                child: const Text('The Print Shack', style: TextStyle(color: Colors.black)),
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
    const UnionShopApp(),
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
      home: const HomeScreen(),
      initialRoute: '/',
      routes: {
        '/product': (context) => const ProductPage(),
        '/portsmouth': (context) => PortsmouthCollectionPage(),
        '/about': (context) => const AboutPage(),
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
      },
    );
  }
}

// --- HomeScreen (uses shared app bar/footer) ---
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void navigateToEssentialHoodie(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const EssentialHoodiePage()),
    );
  }

  void navigateToEssentialTShirt(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EssentialTShirtPage()),
    );
  }

  void navigateToSignatureHoodie(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignatureHoodiePage()),
    );
  }

  void navigateToSignatureTShirt(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignatureTShirtPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildShopAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section
            const HeroCarousel(),

            // Products Section
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  children: [
                    const Text(
                      'Essential Range - Over 20% off!',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 48),
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount:
                          MediaQuery.of(context).size.width > 600 ? 2 : 1,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 48,
                      children: [
                        // Essential Hoodie Card with hover/click
                        ProductCard(
                          title: 'Essential Hoodie',
                          price: '£29.99',
                          imageUrl: 'assets/images/hoodie_navy.png',
                          onTap: () => navigateToEssentialHoodie(context),
                        ),
                        ProductCard(
                          title: 'Essential T-Shirt',
                          price: '£6.99',
                          imageUrl: 'assets/images/tee.png',
                          onTap: () => navigateToEssentialTShirt(context),
                        ),
                      ],
                    ),
                    const SizedBox(height: 64),
                    const Text(
                      'Signature Range',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 48),
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount:
                          MediaQuery.of(context).size.width > 600 ? 2 : 1,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 48,
                      children: [
                        ProductCard(
                          title: 'Signature Hoodie',
                          price: '£32.99',
                          imageUrl: 'assets/images/hoodie_green.png',
                          onTap: () => navigateToSignatureHoodie(context),
                        ),
                        ProductCard(
                          title: 'Signature T-Shirt',
                          price: '£9.99',
                          imageUrl: 'assets/images/tee_navy.png',
                          onTap: () => navigateToSignatureTShirt(context),
                        ),
                      ],
                    ),
                    const SizedBox(height: 64),

                    // New: Portsmouth City Collection
                    const Text(
                      'Portsmouth City Collection',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 24),
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount:
                          MediaQuery.of(context).size.width > 600 ? 3 : 1,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 24,
                      children: [
                        // Portsmouth City Postcard
                        ProductCard(
                          title: 'Portsmouth City Postcard',
                          price: '£6.00',
                          imageUrl: 'assets/images/p_postcard.png',
                          onTap: () {
                            Navigator.pushNamed(context, '/p_postcard');
                          },
                        ),
                        // Portsmouth City Bookmark
                        ProductCard(
                          title: 'Portsmouth City Bookmark',
                          price: '£4.00',
                          imageUrl: 'assets/images/p_bookmark.png',
                          onTap: () {
                            Navigator.pushNamed(context, '/p_bookmark');
                          },
                        ),
                        // Portsmouth City Notebook
                        ProductCard(
                          title: 'Portsmouth City Notebook',
                          price: '£4.00',
                          imageUrl: 'assets/images/p_notebook.png',
                          onTap: () {
                            Navigator.pushNamed(context, '/p_notebook');
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    // View All button
                    Center(
                      child: SizedBox(
                        height: 44,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/portsmouth');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4d2963), // purple
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                          ),
                          child: const Text(
                            'View All',
                            style: TextStyle(fontSize: 16, letterSpacing: 0.5),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Footer
            buildShopFooter(context),
          ],
        ),
      ),
    );
  }
}

class HeroCarousel extends StatefulWidget {
  const HeroCarousel({super.key});

  @override
  State<HeroCarousel> createState() => _HeroCarouselState();
}

class _HeroCarouselState extends State<HeroCarousel> {
  int _currentIndex = 0;

  final List<Map<String, String>> _slides = [
    {
      // Changed to green tee image
      'image': 'assets/images/tee.png',
      'title': 'Essential Range - Over 20% Off!',
      'subtitle':
          'Over 20% off our Essential Range. Come and grab yours while stock lasts!',
    },
    {
      'image':
          'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
      'title': 'Signature Range',
      'subtitle': 'Discover our premium Signature Range products.',
    },
    {
      'image':
          'https://shop.upsu.net/cdn/shop/files/upsu_300x300.png?v=1614735854',
      'title': 'Portsmouth City Collection',
      'subtitle': 'Explore the Portsmouth City Collection today.',
    },
    {
      'image':
          'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
      'title': 'Student Essentials',
      'subtitle': 'Everything you need for your student life.',
    },
  ];

  void _goTo(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _next() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _slides.length;
    });
  }

  void _prev() {
    setState(() {
      _currentIndex = (_currentIndex - 1 + _slides.length) % _slides.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final slide = _slides[_currentIndex];
    final imagePath = slide['image']!;
    Widget imageWidget;
    if (imagePath.startsWith('assets/')) {
      imageWidget = Image.asset(imagePath, fit: BoxFit.cover);
    } else {
      imageWidget = Image.network(imagePath, fit: BoxFit.cover);
    }
    return SizedBox(
      height: 400,
      width: double.infinity,
      child: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                // Fix: Use correct image widget for asset or network
                image: DecorationImage(
                  image: imagePath.startsWith('assets/')
                      ? AssetImage(imagePath) as ImageProvider
                      : NetworkImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
            ),
          ),
          // Content overlay
          Positioned(
            left: 24,
            right: 24,
            top: 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  slide['title']!,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  slide['subtitle']!,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    height: 1.5,
                    fontWeight: FontWeight.bold, // Make subtitle bold
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                SizedBox(
                  height: 52,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4d2963),
                      foregroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    child: const Text(
                      'BROWSE PRODUCTS',
                      style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Carousel bar
          Positioned(
            left: 0,
            right: 0,
            bottom: 24,
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.45), // transparent black
                  borderRadius: BorderRadius.zero, // straight edges
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_left, size: 28),
                      color: Colors.grey[300], // grey arrow
                      onPressed: _prev,
                      splashRadius: 22,
                    ),
                    Row(
                      children: List.generate(_slides.length, (i) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Container(
                            width: 14,
                            height: 14,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle, // circle shape
                              color: i == _currentIndex
                                  ? Colors.white
                                  : Colors.grey[400],
                            ),
                          ),
                        );
                      }),
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_right, size: 28),
                      color: Colors.grey[300], // grey arrow
                      onPressed: _next,
                      splashRadius: 22,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatefulWidget {
  final String title;
  final String price;
  final String imageUrl;
  final VoidCallback? onTap;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.imageUrl,
    this.onTap,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ColorFiltered(
                colorFilter: _isHovering
                    ? const ColorFilter.matrix(<double>[
                        // Slightly brighten (+0.08) and slightly desaturate (-0.12)
                        0.88, 0.06, 0.06, 0, 20, // R
                        0.06, 0.88, 0.06, 0, 20, // G
                        0.06, 0.06, 0.88, 0, 20, // B
                        0,    0,    0,    1, 0,  // A
                      ])
                    : const ColorFilter.mode(
                        Colors.transparent, BlendMode.multiply),
                child: Image.network(
                  widget.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[300],
                      child: const Center(
                        child: Icon(Icons.image_not_supported, color: Colors.grey),
                      ),
                    );
                  },
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text(
                  widget.title,
                  style: const TextStyle(fontSize: 14, color: Colors.black),
                  maxLines: 2,
                ),
                const SizedBox(height: 4),
                Text(
                  widget.price,
                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// --- Essential Hoodie Product Page ---
class EssentialHoodiePage extends StatefulWidget {
  const EssentialHoodiePage({Key? key}) : super(key: key);

  @override
  State<EssentialHoodiePage> createState() => _EssentialHoodiePageState();
}

class _EssentialHoodiePageState extends State<EssentialHoodiePage> {
  String _selectedColor = 'Navy';
  String _selectedSize = 'M';
  int _quantity = 1;
  final TextEditingController _quantityController = TextEditingController(text: '1');

  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Use the same app bar and footer as HomeScreen
    return Scaffold(
      appBar: buildShopAppBar(context),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth > 800;
          // --- Change hoodie image based on selected color ---
          String hoodieImage = _selectedColor == 'White'
              ? 'assets/images/hoodie_white.png'
              : 'assets/images/hoodie_navy.png';
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
              child: Flex(
                direction: isWide ? Axis.horizontal : Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image
                  SizedBox(
                    width: isWide ? 400 : double.infinity,
                    height: isWide ? 480 : 340,
                    child: Image.asset(
                      hoodieImage,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(width: isWide ? 48 : 0, height: isWide ? 0 : 32),
                  // Product details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: isWide ? 24 : 8), // move text down to align with image top
                        const Text(
                          'Essential Hoodie',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Row(
                          children: [
                            // Colour dropdown
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Colour',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                                const SizedBox(height: 8),
                                SizedBox(
                                  width: 180,
                                  height: 48,
                                  child: DropdownButtonFormField<String>(
                                    value: _selectedColor,
                                    items: const [
                                      DropdownMenuItem(
                                        value: 'Navy',
                                        child: Text('Navy'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'White',
                                        child: Text('White'),
                                      ),
                                    ],
                                    onChanged: (val) {
                                      if (val != null) {
                                        setState(() => _selectedColor = val);
                                      }
                                    },
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 32),
                            // Size dropdown
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Size',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                                const SizedBox(height: 8),
                                SizedBox(
                                  width: 180,
                                  height: 48,
                                  child: DropdownButtonFormField<String>(
                                    value: _selectedSize,
                                    items: const [
                                      DropdownMenuItem(
                                        value: 'S',
                                        child: Text('S'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'M',
                                        child: Text('M'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'L',
                                        child: Text('L'),
                                      ),
                                    ],
                                    onChanged: (val) {
                                      if (val != null) {
                                        setState(() => _selectedSize = val);
                                      }
                                    },
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        // Quantity
                        Row(
                          children: [
                            const Text(
                              'Quantity',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16),
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
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 8),
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
                        Text(
                          '£29.99',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4d2963),
                          ),
                        ),
                        const SizedBox(height: 24),
                        ElevatedButton(
                          onPressed: () {
                            Cart().addItem(CartItem(
                              title: 'Essential Hoodie',
                              imageUrl: hoodieImage,
                              price: 29.99,
                              quantity: _quantity,
                            ));
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Added to cart!')),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4d2963),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 32, vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                          child: const Text(
                            'Add to Cart',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 24),
                        const Text(
                          'Redesigned with better materials, our limited addition Baby Pink and Stone Blue Hoodies are ultra cosy made for everyday wear with a modern twist. Soft, durable, and effortlessly versatile.',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      // Footer
      bottomNavigationBar: buildShopFooter(context),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildShopAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'About us',
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
              "Welcome to the Union Shop!\n\n"
              "We’re dedicated to giving you the very best University branded products, with a range of clothing and merchandise available to shop all year round! We even offer an exclusive personalisation service!\n\n"
              "All online purchases are available for delivery or instore collection!\n\n"
              "We hope you enjoy our products as much as we enjoy offering them to you. If you have any questions or comments, please don’t hesitate to contact us at hello@upsu.net.\n\n"
              "Happy shopping!\n\n"
              "The Union Shop & Reception Team​​​​​​​​​",
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
      bottomNavigationBar: buildShopFooter(context),
    );
  }
}

// --- Condensed Product Detail Body Widget ---
class ProductDetailBody extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final String description;
  final List<String> colorOptions;
  final List<String> sizeOptions;
  final String selectedColor;
  final String selectedSize;
  final int quantity;
  final ValueChanged<String> onColorChanged;
  final ValueChanged<String> onSizeChanged;
  final ValueChanged<int> onQuantityChanged;
  final VoidCallback? onAddToCart; // Add this line

  const ProductDetailBody({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    required this.colorOptions,
    required this.sizeOptions,
    required this.selectedColor,
    required this.selectedSize,
    required this.quantity,
    required this.onColorChanged,
    required this.onSizeChanged,
    required this.onQuantityChanged,
    this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 800;
    // Fix: Use a local TextEditingController to avoid creating a new one every build
    final quantityController = TextEditingController(text: quantity.toString());
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
            child: Flex(
              direction: isWide ? Axis.horizontal : Axis.vertical,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: isWide ? 400 : double.infinity,
                  height: isWide ? 480 : 340,
                  child: Image.asset(image, fit: BoxFit.contain),
                ),
                SizedBox(width: isWide ? 48 : 0, height: isWide ? 0 : 32),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: isWide ? 24 : 8),
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          // Colour dropdown
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Colour', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                              const SizedBox(height: 8),
                              SizedBox(
                                width: 180,
                                height: 48,
                                child: DropdownButtonFormField<String>(
                                  value: selectedColor,
                                  items: colorOptions
                                      .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                                      .toList(),
                                  onChanged: (val) {
                                    if (val != null) onColorChanged(val);
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 32),
                          // Size dropdown
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Size', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                              const SizedBox(height: 8),
                              SizedBox(
                                width: 180,
                                height: 48,
                                child: DropdownButtonFormField<String>(
                                  value: selectedSize,
                                  items: sizeOptions
                                      .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                                      .toList(),
                                  onChanged: (val) {
                                    if (val != null) onSizeChanged(val);
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      // Quantity
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
                              controller: quantityController,
                              onChanged: (val) {
                                final n = int.tryParse(val);
                                if (n != null && n > 0) onQuantityChanged(n);
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      Text(
                        price,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4d2963),
                        ),
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: onAddToCart ?? () {},
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
                      const SizedBox(height: 24),
                      Text(
                        description,
                        style: const TextStyle(fontSize: 15, color: Colors.black87),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// --- Example of condensed Product Page using shared widgets ---
class EssentialTShirtPage extends StatefulWidget {
  EssentialTShirtPage({Key? key}) : super(key: key);

  @override
  State<EssentialTShirtPage> createState() => _EssentialTShirtPageState();
}

class _EssentialTShirtPageState extends State<EssentialTShirtPage> {
  String _selectedColor = 'Green';
  String _selectedSize = 'M';
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildShopAppBar(context),
      body: ProductDetailBody(
        image: 'assets/images/tee.png',
        title: 'Essential T-Shirt',
        price: '£6.99',
        description: 'Our Essential T-Shirt is made from soft, breathable cotton for everyday comfort. Now available at a reduced price!',
        colorOptions: const ['Green'], // Only green available
        sizeOptions: const ['S', 'M', 'L'],
        selectedColor: _selectedColor,
        selectedSize: _selectedSize,
        quantity: _quantity,
        onColorChanged: (val) => setState(() => _selectedColor = val),
        onSizeChanged: (val) => setState(() => _selectedSize = val),
        onQuantityChanged: (val) => setState(() => _quantity = val),
        onAddToCart: () {
          Cart().addItem(CartItem(
            title: 'Essential T-Shirt',
            imageUrl: 'assets/images/tee.png',
            price: 6.99,
            quantity: _quantity,
          ));
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Added to cart!')),
          );
        },
      ),
      bottomNavigationBar: buildShopFooter(context),
    );
  }
}

class SignatureHoodiePage extends StatefulWidget {
  SignatureHoodiePage({Key? key}) : super(key: key);

  @override
  State<SignatureHoodiePage> createState() => _SignatureHoodiePageState();
}

class _SignatureHoodiePageState extends State<SignatureHoodiePage> {
  String _selectedColor = 'Green';
  String _selectedSize = 'M';
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildShopAppBar(context),
      body: ProductDetailBody(
        image: 'assets/images/hoodie_green.png',
        title: 'Signature Hoodie',
        price: '£32.99',
        description: 'Our Signature Hoodie features premium materials and a modern fit. Perfect for showing your university pride in style.',
        colorOptions: const ['Green', 'Grey'],
        sizeOptions: const ['S', 'M', 'L'],
        selectedColor: _selectedColor,
        selectedSize: _selectedSize,
        quantity: _quantity,
        onColorChanged: (val) => setState(() => _selectedColor = val),
        onSizeChanged: (val) => setState(() => _selectedSize = val),
        onQuantityChanged: (val) => setState(() => _quantity = val),
        onAddToCart: () {
          Cart().addItem(CartItem(
            title: 'Signature Hoodie',
            imageUrl: 'assets/images/hoodie_green.png',
            price: 32.99,
            quantity: _quantity,
          ));
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Added to cart!')),
          );
        },
      ),
      bottomNavigationBar: buildShopFooter(context),
    );
  }
}

class SignatureTShirtPage extends StatefulWidget {
  SignatureTShirtPage({Key? key}) : super(key: key);

  @override
  State<SignatureTShirtPage> createState() => _SignatureTShirtPageState();
}

class _SignatureTShirtPageState extends State<SignatureTShirtPage> {
  String _selectedColor = 'Navy';
  String _selectedSize = 'M';
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildShopAppBar(context),
      body: ProductDetailBody(
        image: 'assets/images/tee_navy.png',
        title: 'Signature T-Shirt',
        price: '£9.99',
        description: 'Our Signature T-Shirt features premium cotton and a classic fit. Show your university pride with this stylish navy tee.',
        colorOptions: const ['Navy'],
        sizeOptions: const ['S', 'M', 'L'],
        selectedColor: _selectedColor,
        selectedSize: _selectedSize,
        quantity: _quantity,
        onColorChanged: (val) => setState(() => _selectedColor = val),
        onSizeChanged: (val) => setState(() => _selectedSize = val),
        onQuantityChanged: (val) => setState(() => _quantity = val),
        onAddToCart: () {
          Cart().addItem(CartItem(
            title: 'Signature T-Shirt',
            imageUrl: 'assets/images/tee_navy.png',
            price: 9.99,
            quantity: _quantity,
          ));
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Added to cart!')),
          );
        },
      ),
      bottomNavigationBar: buildShopFooter(context),
    );
  }
}

// --- Portsmouth City Product Pages ---

class PortsmouthCityPostcardPage extends StatelessWidget {
  const PortsmouthCityPostcardPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildShopAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 400,
                height: 400,
                child: Image.asset('assets/images/p_postcard.png', fit: BoxFit.contain),
              ),
              const SizedBox(height: 32),
              const Text(
                'Portsmouth City Postcard',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              const SizedBox(height: 16),
              const Text(
                'A beautiful Portsmouth City Postcard, perfect for sending or collecting.',
                style: TextStyle(fontSize: 16, color: Colors.black87),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              const Text(
                '£6.00',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF4d2963)),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: 200,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    Cart().addItem(CartItem(
                      title: 'Portsmouth City Postcard',
                      imageUrl: 'assets/images/p_postcard.png',
                      price: 6.00,
                      quantity: 1,
                    ));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Added to cart!')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4d2963),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                  ),
                  child: const Text(
                    'Add to Cart',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: buildShopFooter(context),
    );
  }
}

class PortsmouthCityBookmarkPage extends StatelessWidget {
  const PortsmouthCityBookmarkPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildShopAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 400,
                height: 400,
                child: Image.asset('assets/images/p_bookmark.png', fit: BoxFit.contain),
              ),
              const SizedBox(height: 32),
              const Text(
                'Portsmouth City Bookmark',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              const SizedBox(height: 16),
              const Text(
                'A stylish Portsmouth City Bookmark for your favourite reads.',
                style: TextStyle(fontSize: 16, color: Colors.black87),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              const Text(
                '£4.00',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF4d2963)),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: 200,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    Cart().addItem(CartItem(
                      title: 'Portsmouth City Bookmark',
                      imageUrl: 'assets/images/p_bookmark.png',
                      price: 4.00,
                      quantity: 1,
                    ));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Added to cart!')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4d2963),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                  ),
                  child: const Text(
                    'Add to Cart',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: buildShopFooter(context),
    );
  }
}

class PortsmouthCityNotebookPage extends StatelessWidget {
  const PortsmouthCityNotebookPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildShopAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 400,
                height: 400,
                child: Image.asset('assets/images/p_notebook.png', fit: BoxFit.contain),
              ),
              const SizedBox(height: 32),
              const Text(
                'Portsmouth City Notebook',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              const SizedBox(height: 16),
              const Text(
                'A handy Portsmouth City Notebook for your notes and sketches.',
                style: TextStyle(fontSize: 16, color: Colors.black87),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              const Text(
                '£4.00',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF4d2963)),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: 200,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    Cart().addItem(CartItem(
                      title: 'Portsmouth City Notebook',
                      imageUrl: 'assets/images/p_notebook.png',
                      price: 4.00,
                      quantity: 1,
                    ));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Added to cart!')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4d2963),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                  ),
                  child: const Text(
                    'Add to Cart',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: buildShopFooter(context),
    );
  }
}

class PortsmouthCollectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildShopAppBar(context),
      body: const Center(child: Text('Portsmouth Collection Page Placeholder')),
      bottomNavigationBar: buildShopFooter(context),
    );
  }
}
