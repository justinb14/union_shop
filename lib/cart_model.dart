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

class Cart {
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
  }

  void removeItem(CartItem item) {
    _items.remove(item);
  }

  void clear() {
    _items.clear();
  }

  double get totalPrice => _items.fold(0, (sum, item) => sum + item.price * item.quantity);
  int get totalQuantity => _items.fold(0, (sum, item) => sum + item.quantity);
}
