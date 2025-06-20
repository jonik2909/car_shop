// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:car_shop/providers/cart.dart';
import 'package:car_shop/screens/orders_screen.dart';
import 'package:car_shop/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Cart cart = Provider.of<Cart>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          "Your Cart",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total:",
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  Chip(
                    backgroundColor: Color(0xff375E97),
                    label: Consumer<Cart>(
                      builder: (context, value, child) => Text(
                        '\$${value.totalAmount}',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      cart.clearCart();

                      Navigator.of(context).pushNamed(OrdersScreen.routeName);
                    },
                    child: Text(
                      "ORDER NOW",
                      style: TextStyle(fontSize: 16, color: Color(0xff375E97)),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cart.cartItems.length,
              itemBuilder: (ctx, i) => CartItem(
                productId: cart.cartItems[i].productId,
                title: cart.cartItems[i].title,
                price: cart.cartItems[i].price,
                quantity: cart.cartItems[i].quantity,
              ),
            ),
          )
        ],
      ),
    );
  }
}
