// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:car_shop/constants/url.dart';
import 'package:car_shop/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: "data",
            );
          },
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
            icon: Icon(
              Icons.favorite_border,
              color: Color(0xffFF00FF),
            ),
            onPressed: () {},
          ),
          title: Text(
            "BMW M5",
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.shopping_cart_rounded,
              color: Color(0xffFF00FF),
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    "Item added to cart",
                    style: TextStyle(fontSize: 16),
                  ),
                  duration: Duration(seconds: 2),
                  action: SnackBarAction(
                    label: "UNDO",
                    onPressed: () {
                      print("Undo action pressed!");
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
