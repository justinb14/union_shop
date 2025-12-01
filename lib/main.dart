import 'package:flutter/material.dart';
import 'package:union_shop/product_page.dart';

// --- Common Widgets for AppBar and Footer ---
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
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.person_outline, size: 26, color: Colors.black),
                padding: const EdgeInsets.all(14),
                constraints: const BoxConstraints(minWidth: 48, minHeight: 48),
                onPressed: () => _navigateToSignIn(context),
              ),
              IconButton(
                icon: const Icon(Icons.shopping_bag_outlined, size: 26, color: Colors.black),
                padding: const EdgeInsets.all(14),
                constraints: const BoxConstraints(minWidth: 48, minHeight: 48),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}

Widget buildShopFooter(BuildContext context) {
  return Container(
    width: double.infinity,
    color: Colors.grey[50],
    padding: const EdgeInsets.all(24),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/facebook_logo.png',
              width: 38,
              height: 38,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 16),
            Image.asset(
              'assets/images/twitter_logo.png',
              width: 28,
              height: 28,
              fit: BoxFit.contain,
            ),
          ],
        ),
        const SizedBox(height: 16),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (c, a1, a2) => const HomeScreen(),
                transitionDuration: Duration.zero,
              ),
            );
          },
          child: const Text(
            '© 2025, upsu-store Powered by Shopify',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.none,
            ),
          ),
        ),
      ],
    ),
  );
}

// --- Main App ---
void main() {
  runApp(const UnionShopApp());
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
        '/portsmouth': (context) => const PortsmouthCollectionPage(),
        '/about': (context) => const AboutPage(),
        '/sale': (context) => const SalePage(),
        '/sale_sweatshirt': (context) => const SaleSweatshirtPage(),
        '/sale_notebook': (context) => const SaleNotebookPage(),
        '/sale_usb': (context) => const SaleUSBPage(),
        '/sale_fidget': (context) => const SaleFidgetPage(),
        '/essential_tshirt': (context) => EssentialTShirtPage(),
        '/signature_hoodie': (context) => SignatureHoodiePage(),
        '/signature_tshirt': (context) => SignatureTShirtPage(),
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
                        _HoverableProductCard(
                          title: 'Essential Hoodie',
                          price: '£29.99',
                          imageUrl: 'assets/images/hoodie_navy.png',
                          onTap: () => navigateToEssentialHoodie(context),
                        ),
                        _HoverableProductCard(
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
                        _HoverableProductCard(
                          title: 'Signature Hoodie',
                          price: '£32.99',
                          imageUrl: 'assets/images/hoodie_green.png',
                          onTap: () => navigateToSignatureHoodie(context),
                        ),
                        _HoverableProductCard(
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
                        _HoverableProductCard(
                          title: 'Portsmouth City Postcard',
                          price: '£6.00',
                          imageUrl: 'assets/images/p_postcard.png',
                          onTap: () {}, // Add navigation if needed
                        ),
                        // Portsmouth City Bookmark
                        _HoverableProductCard(
                          title: 'Portsmouth City Bookmark',
                          price: '£4.00',
                          imageUrl: 'assets/images/p_bookmark.png',
                          onTap: () {}, // Add navigation if needed
                        ),
                        // Portsmouth City Notebook
                        _HoverableProductCard(
                          title: 'Portsmouth City Notebook',
                          price: '£4.00',
                          imageUrl: 'assets/images/p_notebook.png',
                          onTap: () {}, // Add navigation if needed
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
    return SizedBox(
      height: 400,
      width: double.infinity,
      child: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(slide['image']!),
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

class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String imageUrl;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/product');
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.network(
              imageUrl,
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Text(
                title,
                style: const TextStyle(fontSize: 14, color: Colors.black),
                maxLines: 2,
              ),
              const SizedBox(height: 4),
              Text(
                price,
                style: const TextStyle(fontSize: 13, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PortsmouthCollectionPage extends StatelessWidget {
  const PortsmouthCollectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final crossCount = MediaQuery.of(context).size.width > 800
        ? 3
        : (MediaQuery.of(context).size.width > 600 ? 2 : 1);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF4d2963)),
        title: const Text(
          'Portsmouth City Collection',
          style: TextStyle(color: Color(0xFF4d2963)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.count(
          crossAxisCount: crossCount,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            // Portsmouth City Postcard
            _HoverableProductCard(
              title: 'Portsmouth City Postcard',
              price: '£6.00',
              imageUrl: 'assets/images/p_postcard.png',
              onTap: () {}, // Add navigation if needed
            ),
            // Portsmouth City Bookmark
            _HoverableProductCard(
              title: 'Portsmouth City Bookmark',
              price: '£4.00',
              imageUrl: 'assets/images/p_bookmark.png',
              onTap: () {}, // Add navigation if needed
            ),
            // Portsmouth City Notebook
            _HoverableProductCard(
              title: 'Portsmouth City Notebook',
              price: '£4.00',
              imageUrl: 'assets/images/p_notebook.png',
              onTap: () {}, // Add navigation if needed
            ),
          ],
        ),
      ),
    );
  }
}

// Hoverable Product Card for Essential Hoodie
class _HoverableProductCard extends StatefulWidget {
  final String title;
  final String price;
  final String imageUrl;
  final VoidCallback onTap;

  const _HoverableProductCard({
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  State<_HoverableProductCard> createState() => _HoverableProductCardState();
}

class _HoverableProductCardState extends State<_HoverableProductCard> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Image.asset(
                    widget.imageUrl,
                    fit: BoxFit.cover,
                  ),
                  if (_hovering)
                    Positioned.fill(
                      child: Container(
                        color: Colors.white.withOpacity(0.25), // subtle white overlay
                      ),
                    ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    decoration:
                        _hovering ? TextDecoration.underline : TextDecoration.none,
                    decorationThickness: 2,
                  ),
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
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 8),
                                ),
                                controller: TextEditingController(
                                    text: _quantity.toString()),
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
                          onPressed: () {},
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

class SalePage extends StatefulWidget {
  const SalePage({super.key});

  @override
  State<SalePage> createState() => _SalePageState();
}

class _SalePageState extends State<SalePage> {
  // --- Sale products master list ---
  final List<Map<String, String>> _allProducts = [
    {
      'name': 'Essential Sweatshirt',
      'image': 'assets/images/sweatshirt.png',
      'oldPrice': '£28.00',
      'newPrice': '£21.99',
      'route': '/sale_sweatshirt',
      'category': 'Clothing',
    },
    {
      'name': 'Essential T-Shirt',
      'image': 'assets/images/tee.png',
      'oldPrice': '£10.00',
      'newPrice': '£6.99',
      'route': '/essential_tshirt',
      'category': 'Clothing',
    },
    {
      'name': 'Portsmouth Notebook',
      'image': 'assets/images/ports_notebook.png',
      'oldPrice': '£7.00',
      'newPrice': '£4.99',
      'route': '/sale_notebook',
      'category': 'Merchandise',
    },
    {
      'name': 'USB Cable',
      'image': 'assets/images/usb_cable.png',
      'oldPrice': '£5.00',
      'newPrice': '£2.99',
      'route': '/sale_usb',
      'category': 'Merchandise',
    },
    {
      'name': 'Fidget Keyring',
      'image': 'assets/images/fidget_keyring.png',
      'oldPrice': '£3.00',
      'newPrice': '£1.99',
      'route': '/sale_fidget',
      'category': 'PSUT',
    },
  ];

  String _selectedFilter = 'All products';
  String _selectedSort = 'Featured';

  static const List<String> _filterOptions = [
    'All products',
    'Merchandise',
    'Clothing',
    'PSUT',
  ];

  static const List<String> _sortOptions = [
    'Featured',
    'A to Z',
    'Z to A',
    'Low to High',
    'High to Low',
  ];

  List<Map<String, String>> get _filteredProducts {
    if (_selectedFilter == 'All products') return List.from(_allProducts);
    return _allProducts.where((p) => p['category'] == _selectedFilter).toList();
  }

  List<Map<String, String>> get _sortedProducts {
    List<Map<String, String>> list = _filteredProducts;
    switch (_selectedSort) {
      case 'Featured':
        // Only show notebook and cable
        return list.where((p) =>
            p['name'] == 'Portsmouth Notebook' ||
            p['name'] == 'USB Cable').toList();
      case 'A to Z':
        list.sort((a, b) => a['name']!.compareTo(b['name']!));
        return list;
      case 'Z to A':
        list.sort((a, b) => b['name']!.compareTo(a['name']!));
        return list;
      case 'Low to High':
        list.sort((a, b) =>
            _parsePrice(a['newPrice']!).compareTo(_parsePrice(b['newPrice']!)));
        return list;
      case 'High to Low':
        list.sort((a, b) =>
            _parsePrice(b['newPrice']!).compareTo(_parsePrice(a['newPrice']!)));
        return list;
      default:
        return list;
    }
  }

  int _parsePrice(String price) {
    // e.g. '£4.99' -> 499
    return (double.tryParse(price.replaceAll('£', ''))! * 100).round();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildShopAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title centered
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Sale',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Description centered
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Don’t miss out! Get yours before they’re all gone!\n\nAll prices shown are inclusive of the discount 🛒",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.black87,
                    height: 1.6,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(height: 32),
            // --- Filter and Sort Row ---
            Row(
              children: [
                // Filter By
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    children: [
                      const Text(
                        'Filter By',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(width: 8),
                      DropdownButton<String>(
                        value: _selectedFilter,
                        items: _filterOptions
                            .map((f) => DropdownMenuItem(
                                  value: f,
                                  child: Text(f),
                                ))
                            .toList(),
                        onChanged: (val) {
                          if (val != null) {
                            setState(() {
                              _selectedFilter = val;
                            });
                          }
                        },
                        underline: const SizedBox(),
                        style: const TextStyle(color: Colors.black, fontSize: 15),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                // Sort By
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    children: [
                      const Text(
                        'Sort By',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(width: 8),
                      DropdownButton<String>(
                        value: _selectedSort,
                        items: _sortOptions
                            .map((s) => DropdownMenuItem(
                                  value: s,
                                  child: Text(s),
                                ))
                            .toList(),
                        onChanged: (val) {
                          if (val != null) {
                            setState(() {
                              _selectedSort = val;
                            });
                          }
                        },
                        underline: const SizedBox(),
                        style: const TextStyle(color: Colors.black, fontSize: 15),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ],
                  ),
                ),
                // Spacer
                Expanded(child: Container()),
                // Product count
                Text(
                  '${_sortedProducts.length} products',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Sale products grid
            Expanded(
              child: GridView.count(
                crossAxisCount: MediaQuery.of(context).size.width > 800
                    ? 4
                    : (MediaQuery.of(context).size.width > 600 ? 2 : 1),
                crossAxisSpacing: 24,
                mainAxisSpacing: 32,
                childAspectRatio: 0.7,
                children: _sortedProducts.map((product) {
                  return _SaleHoverableProductCard(
                    title: product['name']!,
                    imageUrl: product['image']!,
                    oldPrice: product['oldPrice']!,
                    newPrice: product['newPrice']!,
                    onTap: () {
                      Navigator.pushNamed(context, product['route']!);
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: buildShopFooter(context),
    );
  }
}

// --- Sale Hoverable Product Card ---
class _SaleHoverableProductCard extends StatefulWidget {
  final String title;
  final String imageUrl;
  final String oldPrice;
  final String newPrice;
  final VoidCallback onTap;

  const _SaleHoverableProductCard({
    required this.title,
    required this.imageUrl,
    required this.oldPrice,
    required this.newPrice,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  State<_SaleHoverableProductCard> createState() => _SaleHoverableProductCardState();
}

class _SaleHoverableProductCardState extends State<_SaleHoverableProductCard> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ColorFiltered(
                colorFilter: _hovering
                    ? const ColorFilter.mode(Colors.transparent, BlendMode.saturation)
                    : const ColorFilter.mode(Colors.grey, BlendMode.saturation),
                child: Image.asset(
                  widget.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
                decoration: _hovering ? TextDecoration.underline : TextDecoration.none,
                decorationThickness: 2,
              ),
              maxLines: 2,
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Text(
                  widget.oldPrice,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  widget.newPrice,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Color(0xFF4d2963),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// --- Sale Product Pages (stubs, similar to Essential Hoodie) ---
class SaleSweatshirtPage extends StatelessWidget {
  const SaleSweatshirtPage({super.key});
  @override
  Widget build(BuildContext context) {
    return _SaleProductDetailPage(
      title: 'Essential Sweatshirt',
      image: 'assets/images/sweatshirt.png',
      oldPrice: '£28.00',
      newPrice: '£21.99',
      description: 'Our classic Essential Sweatshirt, now at a special sale price!',
    );
  }
}

class SaleNotebookPage extends StatelessWidget {
  const SaleNotebookPage({super.key});
  @override
  Widget build(BuildContext context) {
    return _SaleProductDetailPage(
      title: 'Portsmouth Notebook',
      image: 'assets/images/ports_notebook.png',
      oldPrice: '£7.00',
      newPrice: '£4.99',
      description: 'Take notes in style with the Portsmouth Notebook.',
    );
  }
}

class SaleUSBPage extends StatelessWidget {
  const SaleUSBPage({super.key});
  @override
  Widget build(BuildContext context) {
    return _SaleProductDetailPage(
      title: 'USB Cable',
      image: 'assets/images/usb_cable.png',
      oldPrice: '£5.00',
      newPrice: '£2.99',
      description: 'Handy USB cable for all your charging needs.',
    );
  }
}

class SaleFidgetPage extends StatelessWidget {
  const SaleFidgetPage({super.key});
  @override
  Widget build(BuildContext context) {
    return _SaleProductDetailPage(
      title: 'Fidget Keyring',
      image: 'assets/images/fidget_keyring.png',
      oldPrice: '£3.00',
      newPrice: '£1.99',
      description: 'Keep your hands busy with this fun Fidget Keyring.',
    );
  }
}

// --- Sale Product Detail Page Widget ---
class _SaleProductDetailPage extends StatefulWidget {
  final String title;
  final String image;
  final String oldPrice;
  final String newPrice;
  final String description;

  const _SaleProductDetailPage({
    required this.title,
    required this.image,
    required this.oldPrice,
    required this.newPrice,
    required this.description,
    Key? key,
  }) : super(key: key);

  @override
  State<_SaleProductDetailPage> createState() => _SaleProductDetailPageState();
}

class _SaleProductDetailPageState extends State<_SaleProductDetailPage> {
  bool _hovering = false;
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 800;
    return Scaffold(
      appBar: buildShopAppBar(context),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
              child: Flex(
                direction: isWide ? Axis.horizontal : Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image with hover saturation
                  SizedBox(
                    width: isWide ? 400 : double.infinity,
                    height: isWide ? 480 : 340,
                    child: MouseRegion(
                      onEnter: (_) => setState(() => _hovering = true),
                      onExit: (_) => setState(() => _hovering = false),
                      child: ColorFiltered(
                        colorFilter: _hovering
                            ? const ColorFilter.mode(Colors.transparent, BlendMode.saturation)
                            : const ColorFilter.mode(Colors.grey, BlendMode.saturation),
                        child: Image.asset(
                          widget.image,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: isWide ? 48 : 0, height: isWide ? 0 : 32),
                  // Product details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: isWide ? 24 : 8),
                        Text(
                          widget.title,
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Row(
                          children: [
                            Text(
                              widget.oldPrice,
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              widget.newPrice,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF4d2963),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
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
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 8),
                                ),
                                controller: TextEditingController(
                                    text: _quantity.toString()),
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
                          onPressed: () {},
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
                        Text(
                          widget.description,
                          style: const TextStyle(
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
  });

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 800;
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
                              controller: TextEditingController(text: quantity.toString()),
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
                        onPressed: () {},
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
      ),
      bottomNavigationBar: buildShopFooter(context),
    );
  }
}

// --- Sign In Page ---
class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool get _canContinue =>
      _emailController.text.trim().isNotEmpty &&
      _passwordController.text.trim().isNotEmpty;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() => setState(() {}));
    _passwordController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: buildShopAppBar(context),
      body: Center(
        child: Container(
          width: 360,
          padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 32),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.07),
                blurRadius: 24,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(
                'https://shop.upsu.net/cdn/shop/files/upsu_300x300.png?v=1614735854',
                height: 64,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 24),
              const Text(
                'Sign in',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 28),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  filled: true,
                  fillColor: Colors.grey[50],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 18),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  filled: true,
                  fillColor: Colors.grey[50],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 28),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: _canContinue ? () {} : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _canContinue ? const Color(0xFF4d2963) : Colors.grey[400],
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: 0.5),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
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
      ),
      bottomNavigationBar: buildShopFooter(context),
    );
  }
}
