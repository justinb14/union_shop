import 'package:flutter/material.dart';
import 'main.dart'; // For buildShopAppBar
import 'footer.dart'; // For buildShopFooter

// --- Sale Page and Related Widgets ---
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
      body: SingleChildScrollView(
        child: Padding(
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