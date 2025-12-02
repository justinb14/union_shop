import 'package:flutter/material.dart';
import '../main.dart'; // For buildShopAppBar
import '../footer.dart'; // For buildShopFooter
import '../product_card.dart';

class PortsmouthCollectionPage extends StatelessWidget {
  const PortsmouthCollectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildShopAppBar(context),
      body: const Center(
        child: Text(
          'Portsmouth Collection Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
      bottomNavigationBar: buildShopFooter(context),
    );
  }
}
