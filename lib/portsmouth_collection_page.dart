import 'package:flutter/material.dart';
import 'main.dart'; // For buildShopAppBar and _HoverableProductCard

class PortsmouthCollectionPage extends StatelessWidget {
  const PortsmouthCollectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final crossCount = MediaQuery.of(context).size.width > 800
        ? 3
        : (MediaQuery.of(context).size.width > 600 ? 2 : 1);

    return Scaffold(
      appBar: buildShopAppBar(context),
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
              onTap: () {
                Navigator.pushNamed(context, '/p_postcard');
              },
            ),
            // Portsmouth City Bookmark
            _HoverableProductCard(
              title: 'Portsmouth City Bookmark',
              price: '£4.00',
              imageUrl: 'assets/images/p_bookmark.png',
              onTap: () {
                Navigator.pushNamed(context, '/p_bookmark');
              },
            ),
            // Portsmouth City Notebook
            _HoverableProductCard(
              title: 'Portsmouth City Notebook',
              price: '£4.00',
              imageUrl: 'assets/images/p_notebook.png',
              onTap: () {
                Navigator.pushNamed(context, '/p_notebook');
              },
            ),
          ],
        ),
      ),
    );
  }
}
