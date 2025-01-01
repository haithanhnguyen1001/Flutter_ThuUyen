import 'package:ecommerce_thanh/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _cart = [];
  List<Product> get cart => _cart;

  void addProductToCart(Product product, int quantity) {
    product.quantity = quantity;
    if (_cart.contains(product)) {
      for (Product element in _cart) {
        if (element.title == product.title) {
          element.quantity = element.quantity + product.quantity;
        }
      }
    } else {
      _cart.add(product);
    }
    notifyListeners();
  }

  incrementQtn(int index) {
    _cart[index].quantity++;
    notifyListeners();
  }

  decrementQtn(int index) {
    if (_cart[index].quantity > 1) {
      _cart[index].quantity--;
      notifyListeners();
    } else {
      _cart.removeAt(index);
      notifyListeners();
    }
  }

  totalPrice() {
    double total1 = 0.0;
    for (Product element in _cart) {
      total1 += element.quantity * element.price;
    }
    return total1;
  }

  static CartProvider of(
    BuildContext context, {
    bool listen = true,
  }) {
    return Provider.of<CartProvider>(context, listen: listen);
  }
}
