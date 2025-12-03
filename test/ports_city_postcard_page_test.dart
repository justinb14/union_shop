import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:union_shop/portsmouth_city_postcard_page.dart';

void main() {
  testWidgets('PortsmouthCityPostcardPage renders and displays info', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: PortsmouthCityPostcardPage(),
      ),
    );
    expect(find.text('Portsmouth City Postcard'), findsOneWidget);
    expect(find.text('£6.00'), findsOneWidget);
    expect(find.text('Add to Cart'), findsOneWidget);
  });
}