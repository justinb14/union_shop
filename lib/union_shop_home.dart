import 'package:flutter/material.dart';
import 'footer.dart';
import 'product_card.dart';
import 'cart_model.dart';

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
                        0, 0, 0, 1, 0, // A
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
                        child:
                            Icon(Icons.image_not_supported, color: Colors.grey),
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