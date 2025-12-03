import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/cart_model.dart';

void main() {
  group('Cart', () {
    late Cart cart;

    setUp(() {
      cart = Cart();
      cart.clear();
    });

    test('addItem increases item count and total cost', () {
      cart.addItem(CartItem(
        title: 'Test Product',
        imageUrl: 'test.png',
        price: 10.0,
        quantity: 2,
      ));
      expect(cart.items.length, 1);
      expect(cart.totalPrice, 20.0);
    });

    test('removeItem decreases count and cost', () {
      final item = CartItem(
        title: 'Test Product',
        imageUrl: 'test.png',
        price: 10.0,
        quantity: 2,
      );
      cart.addItem(item);
      cart.removeItem(item);
      expect(cart.items.length, 0);
      expect(cart.totalPrice, 0.0);
    });

    test('totalItems returns correct number of items', () {
      cart.addItem(CartItem(
        title: 'A',
        imageUrl: 'a.png',
        price: 5.0,
        quantity: 1,
      ));
      cart.addItem(CartItem(
        title: 'B',
        imageUrl: 'b.png',
        price: 2.0,
        quantity: 3,
      ));
      expect(cart.totalItems, 4);
    });
  });
}