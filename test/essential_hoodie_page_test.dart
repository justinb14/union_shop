import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:union_shop/essential_hoodie_page.dart';

void main() {
  testWidgets('EssentialHoodiePage renders and displays info', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: EssentialHoodiePage(),
      ),
    );
    expect(find.text('Essential Hoodie'), findsOneWidget);
    expect(find.text('£29.99'), findsOneWidget);
    expect(find.text('Add to Cart'), findsOneWidget);
    expect(find.text('Colour'), findsOneWidget);
    expect(find.text('Size'), findsOneWidget);
    expect(find.text('Quantity'), findsOneWidget);
  });
}