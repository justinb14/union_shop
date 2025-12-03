import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:union_shop/signature_tshirt_page.dart';

void main() {
  testWidgets('SignatureTShirtPage renders and displays info', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: SignatureTShirtPage(),
      ),
    );
    expect(find.text('Signature T-Shirt'), findsOneWidget);
    expect(find.text('£9.99'), findsOneWidget);
    expect(find.text('Add to Cart'), findsOneWidget);
    expect(find.text('Colour'), findsOneWidget);
    expect(find.text('Size'), findsOneWidget);
    expect(find.text('Quantity'), findsOneWidget);
  });
}