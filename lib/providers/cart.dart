import 'package:car_shop/models/cart_item.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  // state & method
  Map<String, CartItemModel> _cartItems = {};

  List<CartItemModel> get cartItems {
    return _cartItems.values.toList();
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
  // clearCart
  // removeSingleItem
}
