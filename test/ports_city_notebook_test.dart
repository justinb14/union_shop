import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:union_shop/portsmouth_city_notebook_page.dart';

void main() {
  testWidgets('PortsmouthCityNotebookPage renders and displays info', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: PortsmouthCityNotebookPage(),
      ),
    );
    expect(find.text('Portsmouth City Notebook'), findsOneWidget);
    expect(find.text('£4.00'), findsOneWidget);
    expect(find.text('Add to Cart'), findsOneWidget);
  });
}