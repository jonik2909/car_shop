// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:car_shop/constants/config.dart';
import 'package:car_shop/constants/url.dart';
import 'package:car_shop/models/product.dart';
import 'package:car_shop/providers/products.dart';
import 'package:car_shop/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    final Product targetProduct = Provider.of<Product>(context, listen: false);

    print(targetProduct.title);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: targetProduct,
            );
          },
          child: Image.network(
            '$serverApi/${targetProduct.imageUrl}',
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
            icon: Consumer<Product>(
              builder: (ctx, _, child) => Icon(
                targetProduct.favorite ? Icons.favorite : Icons.favorite_border,
                color: Color(0xffFF00FF),
              ),
            ),
            onPressed: () {
              targetProduct.toggleFavoriteStatus();
            },
          ),
          title: Text(
            targetProduct.title,
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
