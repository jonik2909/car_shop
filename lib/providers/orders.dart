import 'package:car_shop/models/cart_item.dart';
import 'package:car_shop/models/order_item.dart';
import 'package:flutter/material.dart';

class Orders extends ChangeNotifier {
  // state & method
  List<OrderItemModel> _orders = [];

  List<OrderItemModel> get ordersData {
    return _orders;
  }

  void addOrder(List<CartItemModel> cartProducts, int total) {
    _orders.insert(
      0,
      OrderItemModel(
        amount: total,
        cartProducts: cartProducts,
        time: DateTime.now(),
      ),
    );

    notifyListeners();
  }
}
