// ignore_for_file: prefer_const_constructors

import 'package:car_shop/widgets/product_item.dart';
import 'package:flutter/material.dart';

class ProductsSample extends StatelessWidget {
  final bool showFavorites;

  const ProductsSample({super.key, required this.showFavorites});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(10),
      itemCount: 5,
      itemBuilder: (ctx, i) => ProductItem(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
