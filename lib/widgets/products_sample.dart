// ignore_for_file: prefer_const_constructors

import 'package:car_shop/providers/products.dart';
import 'package:car_shop/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsSample extends StatelessWidget {
  final bool showFavorites;

  const ProductsSample({super.key, required this.showFavorites});

  @override
  Widget build(BuildContext context) {
    Products products = Provider.of<Products>(context, listen: false);
    final productsData = products.items;

    return GridView.builder(
      padding: EdgeInsets.all(10),
      itemCount: productsData.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: productsData[i],
        child: ProductItem(),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
