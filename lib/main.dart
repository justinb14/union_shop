import 'package:flutter/material.dart';
import 'package:union_shop/product_page.dart';

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
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void navigateToProduct(BuildContext context) {
    Navigator.pushNamed(context, '/product');
  }

  void placeholderCallbackForButtons() {
    // This is the event handler for buttons that don't work yet
  }

  void navigateToEssentialHoodie(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const EssentialHoodiePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(96),
        child: Material(
          color: Colors.white,
          child: Column(
            children: [
              // Top sale banner
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 10),
                color: const Color(0xFF4d2963),
                child: const Text(
                  'BIG SALE! OUR ESSENTIAL RANGE HAS DROPPED IN PRICE! OVER 20% OFF! COME GRAB YOURS WHILE STOCK LASTS!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14, // reduced to avoid overflow
                    fontWeight: FontWeight.w700, // bolder / "fatter"
                    height: 1.1,
                    letterSpacing: 2.0, // more spaced out
                  ),
                ),
              ),
              // Navigation row
              SizedBox(
                height: 48,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => navigateToHome(context),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0), // move logo down
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
                                      child: Icon(Icons.image_not_supported,
                                          color: Colors.grey),
                                    ),
                                  );
                                },
                              ),
                            ),
                            // Text label removed — only the logo image is shown
                          ],
                        ),
                      ),
                      const SizedBox(width: 24),
                      // Mini titles (nav links)
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center, // center links between logo and icons
                          children: [
                            TextButton(
                              onPressed: () => navigateToHome(context),
                              child: const Text('Home',
                                  style: TextStyle(color: Colors.black)),
                            ),
                            const SizedBox(width: 12),
                            TextButton(
                              onPressed: () => navigateToProduct(context),
                              child: const Text('Shop',
                                  style: TextStyle(color: Colors.black)),
                            ),
                            const SizedBox(width: 12),
                            TextButton(
                              onPressed: placeholderCallbackForButtons,
                              child: const Text('The Print Shack',
                                  style: TextStyle(color: Colors.black)),
                            ),
                            const SizedBox(width: 12),
                            TextButton(
                              onPressed: placeholderCallbackForButtons,
                              child: const Text('SALE!',
                                  style: TextStyle(color: Colors.black)),
                            ),
                            const SizedBox(width: 12),
                            TextButton(
                              onPressed: placeholderCallbackForButtons,
                              child: const Text('About',
                                  style: TextStyle(color: Colors.black)),
                            ),
                          ],
                        ),
                      ),
                      // Right-side icons (kept small)
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0), // move icons down
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.search,
                                size: 26,
                                color: Colors.black,
                              ),
                              padding: const EdgeInsets.all(14),
                              constraints: const BoxConstraints(
                                minWidth: 48,
                                minHeight: 48,
                              ),
                              onPressed: placeholderCallbackForButtons,
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.person_outline,
                                size: 26,
                                color: Colors.black,
                              ),
                              padding: const EdgeInsets.all(14),
                              constraints: const BoxConstraints(
                                minWidth: 48,
                                minHeight: 48,
                              ),
                              onPressed: placeholderCallbackForButtons,
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.shopping_bag_outlined,
                                size: 26,
                                color: Colors.black,
                              ),
                              padding: const EdgeInsets.all(14),
                              constraints: const BoxConstraints(
                                minWidth: 48,
                                minHeight: 48,
                              ),
                              onPressed: placeholderCallbackForButtons,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
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
                        const ProductCard(
                          title: 'Placeholder Product 2',
                          price: '£15.00',
                          imageUrl:
                              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
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
                      children: const [
                        ProductCard(
                          title: 'Placeholder Product 3',
                          price: '£20.00',
                          imageUrl:
                              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                        ),
                        ProductCard(
                          title: 'Placeholder Product 4',
                          price: '£25.00',
                          imageUrl:
                              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
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
                      children: const [
                        ProductCard(
                          title: 'Portsmouth Postcard',
                          price: '£6.00',
                          imageUrl:
                              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
                        ),
                        ProductCard(
                          title: 'Portsmouth Magnet',
                          price: '£4.00',
                          imageUrl:
                              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                        ),
                        ProductCard(
                          title: 'Portsmouth Badge',
                          price: '£3.50',
                          imageUrl:
                              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
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
            Container(
              width: double.infinity,
              color: Colors.grey[50],
              padding: const EdgeInsets.all(24),
              child: const Text(
                'Placeholder Footer',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
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
      'image':
          'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
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
          children: const [
            ProductCard(
              title: 'Portsmouth Postcard 1',
              price: '£6.00',
              imageUrl:
                  'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
            ),
            ProductCard(
              title: 'Portsmouth Magnet 1',
              price: '£4.00',
              imageUrl:
                  'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
            ),
            ProductCard(
              title: 'Portsmouth Magnet 2',
              price: '£4.00',
              imageUrl:
                  'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
            ),
            ProductCard(
              title: 'Portsmouth Badge 1',
              price: '£3.50',
              imageUrl:
                  'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
            ),
            ProductCard(
              title: 'Portsmouth Postcard 2',
              price: '£6.00',
              imageUrl:
                  'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
            ),
            ProductCard(
              title: 'Portsmouth Bundle',
              price: '£12.00',
              imageUrl:
                  'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(96),
        child: Material(
          color: Colors.white,
          child: Column(
            children: [
              // Top sale banner
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 10),
                color: const Color(0xFF4d2963),
                child: const Text(
                  'BIG SALE! OUR ESSENTIAL RANGE HAS DROPPED IN PRICE! OVER 20% OFF! COME GRAB YOURS WHILE STOCK LASTS!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    height: 1.1,
                    letterSpacing: 2.0,
                  ),
                ),
              ),
              // Navigation row (copied from HomeScreen)
              SizedBox(
                height: 48,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pushNamedAndRemoveUntil(
                            context, '/', (route) => false),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
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
                                      child: Icon(Icons.image_not_supported,
                                          color: Colors.grey),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () => Navigator.pushNamedAndRemoveUntil(
                                  context, '/', (route) => false),
                              child: const Text('Home',
                                  style: TextStyle(color: Colors.black)),
                            ),
                            const SizedBox(width: 12),
                            TextButton(
                              onPressed: () =>
                                  Navigator.pushNamed(context, '/product'),
                              child: const Text('Shop',
                                  style: TextStyle(color: Colors.black)),
                            ),
                            const SizedBox(width: 12),
                            TextButton(
                              onPressed: () {},
                              child: const Text('The Print Shack',
                                  style: TextStyle(color: Colors.black)),
                            ),
                            const SizedBox(width: 12),
                            TextButton(
                              onPressed: () {},
                              child: const Text('SALE!',
                                  style: TextStyle(color: Colors.black)),
                            ),
                            const SizedBox(width: 12),
                            TextButton(
                              onPressed: () {},
                              child: const Text('About',
                                  style: TextStyle(color: Colors.black)),
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
                              icon: const Icon(
                                Icons.search,
                                size: 26,
                                color: Colors.black,
                              ),
                              padding: const EdgeInsets.all(14),
                              constraints: const BoxConstraints(
                                minWidth: 48,
                                minHeight: 48,
                              ),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.person_outline,
                                size: 26,
                                color: Colors.black,
                              ),
                              padding: const EdgeInsets.all(14),
                              constraints: const BoxConstraints(
                                minWidth: 48,
                                minHeight: 48,
                              ),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.shopping_bag_outlined,
                                size: 26,
                                color: Colors.black,
                              ),
                              padding: const EdgeInsets.all(14),
                              constraints: const BoxConstraints(
                                minWidth: 48,
                                minHeight: 48,
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth > 800;
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
                      'assets/images/hoodie_navy.png',
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
      bottomNavigationBar: Container(
        width: double.infinity,
        color: Colors.grey[50],
        padding: const EdgeInsets.all(24),
        child: const Text(
          'Placeholder Footer',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
