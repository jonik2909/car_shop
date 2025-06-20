// ignore_for_file: prefer_const_constructors

import 'package:car_shop/providers/orders.dart';
import 'package:car_shop/widgets/app_drawer.dart';
import 'package:car_shop/widgets/order_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = "/my-orders";

  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Orders orders = Provider.of<Orders>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          "MY ORDERS",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: orders.ordersData.length,
        itemBuilder: (ctx, i) => OrderItem(
          orderItem: orders.ordersData[i],
        ),
      ),
      drawer: AppDrawer(),
    );
  }
}
