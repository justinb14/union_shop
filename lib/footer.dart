import 'package:flutter/material.dart';
import 'main.dart'; // For HomeScreen

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
