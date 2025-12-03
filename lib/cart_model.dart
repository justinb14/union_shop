import 'package:flutter/material.dart';

class CartItem {
  final String title;
  final String imageUrl;
  final double price;
  int quantity;

  CartItem({
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.quantity,
  });
}

class Cart extends ChangeNotifier {
  static final Cart _instance = Cart._internal();
  factory Cart() => _instance;
  Cart._internal();

  final List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);

  void addItem(CartItem item) {
    final idx = _items.indexWhere((e) => e.title == item.title && e.imageUrl == item.imageUrl && e.price == item.price);
    if (idx != -1) {
      _items[idx].quantity += item.quantity;
    } else {
      _items.add(item);
    }
    notifyListeners();
  }

  void removeItem(CartItem item) {
    _items.remove(item);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }

  double get totalPrice => _items.fold(0, (sum, item) => sum + item.price * item.quantity);

  int get totalItems => items.fold(0, (sum, item) => sum + item.quantity);
}
