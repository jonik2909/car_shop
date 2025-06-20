import 'package:car_shop/models/cart_item.dart';

class OrderItemModel {
  final int amount;
  final List<CartItemModel> cartProducts;
  final DateTime time;

  OrderItemModel({
    required this.amount,
    required this.cartProducts,
    required this.time,
  });
}
