import 'package:car_shop/models/cart_item.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  // state & method
  Map<String, CartItemModel> _cartItems = {};

  List<CartItemModel> get cartItems {
    return _cartItems.values.toList();
  }

  int get totalAmount {
    int total = 0;
    _cartItems.forEach((key, value) {
      total += value.quantity * value.price;
    });
    return total;
  }

  // addCartItem
  void addCartItem(String productId, int price, String title) {
    // check
    bool checkItem = _cartItems.containsKey(productId);

    if (checkItem) {
      _cartItems.update(
        productId,
        (target) => CartItemModel(
          productId: productId,
          title: title,
          price: price,
          quantity: target.quantity + 1,
        ),
      );
    } else {
      _cartItems[productId] = CartItemModel(
        productId: productId,
        title: title,
        price: price,
        quantity: 1,
      );
    }

    notifyListeners();
  }

  // deleteCartItem
  void deleteCartItem(String productId) {
    bool checkItem = _cartItems.containsKey(productId);

    if (checkItem) {
      _cartItems.remove(productId);
      notifyListeners();
    }
  }

  // removeSingleItem
  void removeSingleItem(String productId) {
    bool checkItem = _cartItems.containsKey(productId);

    if (!checkItem) {
      print("Error: Cart has no product with $productId");
      return;
    } else if (_cartItems[productId]!.quantity > 1) {
      _cartItems.update(
          productId,
          (target) => CartItemModel(
                productId: productId,
                title: target.title,
                price: target.price,
                quantity: target.quantity - 1,
              ));
    } else {
      _cartItems.remove(productId);
    }

    notifyListeners();
  }

  // clearCart
}
