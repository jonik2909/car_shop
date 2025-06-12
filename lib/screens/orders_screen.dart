// ignore_for_file: prefer_const_constructors

import 'package:car_shop/widgets/app_drawer.dart';
import 'package:car_shop/widgets/order_item.dart';
import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = "/my-orders";

  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          "MY ORDERS",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (ctx, i) => OrderItem(),
      ),
      drawer: AppDrawer(),
    );
  }
}
