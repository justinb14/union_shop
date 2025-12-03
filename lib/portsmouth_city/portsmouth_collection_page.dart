import 'package:flutter/material.dart';
import '../main.dart'; // For buildShopAppBar
import '../footer.dart'; // For buildShopFooter
import '../portsmouth_city_postcard_page.dart';
import '../portsmouth_city_bookmark_page.dart';
import '../portsmouth_city_notebook_page.dart';
// If you have a magnet page, import it here:
// import '../portsmouth_city_magnet_page.dart';

class PortsmouthCollectionPage extends StatelessWidget {
  const PortsmouthCollectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Portsmouth City Collection')),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
        child: GridView.count(
          crossAxisCount: MediaQuery.of(context).size.width > 600 ? 2 : 1,
          crossAxisSpacing: 24,
          mainAxisSpacing: 32,
          childAspectRatio: 1.4,
          children: [
            // Postcard
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PortsmouthCityPostcardPage()),
                );
              },
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/p_postcard.png', height: 120, fit: BoxFit.contain),
                    const SizedBox(height: 16),
                    const Text('Portsmouth City Postcard', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    const Text('£6.00', style: TextStyle(fontSize: 16, color: Color(0xFF4d2963))),
                  ],
                ),
              ),
            ),
            // Bookmark
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PortsmouthCityBookmarkPage()),
                );
              },
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/p_bookmark.png', height: 120, fit: BoxFit.contain),
                    const SizedBox(height: 16),
                    const Text('Portsmouth City Bookmark', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    const Text('£4.00', style: TextStyle(fontSize: 16, color: Color(0xFF4d2963))),
                  ],
                ),
              ),
            ),
            // Notebook
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PortsmouthCityNotebookPage()),
                );
              },
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/p_notebook.png', height: 120, fit: BoxFit.contain),
                    const SizedBox(height: 16),
                    const Text('Portsmouth City Notebook', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    const Text('£4.00', style: TextStyle(fontSize: 16, color: Color(0xFF4d2963))),
                  ],
                ),
              ),
            ),
            // Magnet (if you have a magnet page and image)
            // GestureDetector(
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => const PortsmouthCityMagnetPage()),
            //     );
            //   },
            //   child: Card(
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Image.asset('assets/images/p_magnet.png', height: 120, fit: BoxFit.contain),
            //         const SizedBox(height: 16),
            //         const Text('Portsmouth City Magnet', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            //         const SizedBox(height: 8),
            //         const Text('£X.XX', style: TextStyle(fontSize: 16, color: Color(0xFF4d2963))),
            //       ],
            //     ),
            //   ),
            // ),
          ],
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
