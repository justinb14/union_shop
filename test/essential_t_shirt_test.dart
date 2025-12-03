import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:union_shop/essential_tshirt_page.dart';

void main() {
  testWidgets('EssentialTShirtPage renders and displays info', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: EssentialTShirtPage(),
      ),
    );
    expect(find.text('Essential T-Shirt'), findsOneWidget);
    expect(find.text('£6.99'), findsOneWidget);
    expect(find.text('Add to Cart'), findsOneWidget);
    expect(find.text('Colour'), findsOneWidget);
    expect(find.text('Size'), findsOneWidget);
    expect(find.text('Quantity'), findsOneWidget);
  });
}