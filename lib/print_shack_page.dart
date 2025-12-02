import 'package:flutter/material.dart';
import 'footer.dart';
import 'main.dart'; // For buildShopAppBar

class PrintShackPage extends StatelessWidget {
  const PrintShackPage({super.key});

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
                  'The Print Shack',
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
              "Welcome to The Print Shack!\n\n"
              "We offer a wide range of personalisation and printing services for students and staff. From custom t-shirts to mugs and more, visit us in-store or contact us for your printing needs.\n\n"
              "For more information, email printshack@upsu.net.",
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
