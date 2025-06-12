// ignore_for_file: prefer_const_constructors

import 'package:car_shop/screens/cart_screen.dart';
import 'package:flutter/material.dart';

class BadgeCard extends StatelessWidget {
  final String value;
  const BadgeCard({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        IconButton(
          onPressed: () {
            print("go to cart screen!");
            Navigator.of(context).pushNamed(CartScreen.routeName);
          },
          icon: Icon(
            Icons.add_shopping_cart,
          ),
        ),
        Positioned(
          right: 3,
          top: 0,
          child: Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.blue,
            ),
            constraints: const BoxConstraints(minWidth: 20, minHeight: 20),
            child: Center(
              child: Text(
                value,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ),
        )
      ],
    );
  }
}
