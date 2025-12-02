import 'package:flutter/material.dart';

class HoverableProductCard extends StatefulWidget {
  final String title;
  final String price;
  final String imageUrl;
  final VoidCallback? onTap;

  const HoverableProductCard({
    Key? key,
    required this.title,
    required this.price,
    required this.imageUrl,
    this.onTap,
  }) : super(key: key);

  @override
  State<HoverableProductCard> createState() => _HoverableProductCardState();
}

class _HoverableProductCardState extends State<HoverableProductCard> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final card = GestureDetector(
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: _hovering ? const Color(0xFF4d2963) : Colors.grey[300]!,
            width: 2,
          ),
          boxShadow: _hovering
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ]
              : [],
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: widget.imageUrl.startsWith('assets/')
                  ? Image.asset(widget.imageUrl, fit: BoxFit.contain)
                  : Image.network(widget.imageUrl, fit: BoxFit.contain),
            ),
            const SizedBox(height: 16),
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              widget.price,
              style: const TextStyle(
                fontSize: 15,
                color: Color(0xFF4d2963),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );

    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: SizedBox(
        height: 320,
        child: card,
      ),
    );
  }
}
