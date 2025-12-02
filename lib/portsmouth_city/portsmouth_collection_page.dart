import 'package:flutter/material.dart';
import '../main.dart'; // For buildShopAppBar
import '../footer.dart'; // For buildShopFooter
import '../product_card.dart';
import '../cart_model.dart';

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

class PortsmouthCityPostcardPage extends StatelessWidget {
  const PortsmouthCityPostcardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildShopAppBar(context),
      body: const Center(
        child: Text(
          'Portsmouth City Postcard Page',
          style: TextStyle(fontSize: 24),
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
      body: const Center(
        child: Text(
          'Portsmouth City Bookmark Page',
          style: TextStyle(fontSize: 24),
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
      body: const Center(
        child: Text(
          'Portsmouth City Notebook Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
      bottomNavigationBar: buildShopFooter(context),
    );
  }
}
