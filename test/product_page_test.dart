import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:union_shop/product_page.dart';

void main() {
  testWidgets('ProductPage renders and displays product info', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ProductPage(),
      ),
    );
    expect(find.text('Product'), findsOneWidget); // Adjust to your actual product name
    expect(find.textContaining('£'), findsWidgets); // Price text
  });

  testWidgets('Add to Cart button works', (WidgetTester tester) async {
    bool addToCartCalled = false;

    await tester.pumpWidget(
      MaterialApp(
        home: ProductPage(
          onAddToCart: () {
            addToCartCalled = true;
          },
        ),
      ),
    );

    final addToCartButton = find.text('Add to Cart');
    expect(addToCartButton, findsOneWidget);

    await tester.tap(addToCartButton);
    await tester.pump();

    expect(addToCartCalled, isTrue);
  });
}