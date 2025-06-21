// ignore_for_file: prefer_const_constructors

import 'package:car_shop/models/product.dart';
import 'package:car_shop/providers/products.dart';
import 'package:car_shop/screens/manage_product_screen.dart';
import 'package:car_shop/widgets/app_drawer.dart';
import 'package:car_shop/widgets/user_product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user-products';

  const UserProductsScreen({super.key});

  Future<void> refreshProducts(BuildContext context) async {
    final Products products = Provider.of<Products>(context, listen: false);
    await products.fetchAndSetProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Your Added Products",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(ManageProductScreen.routeName);
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => refreshProducts(context),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Consumer<Products>(
            builder: (context, products, child) => ListView.separated(
              itemCount: products.items.length,
              itemBuilder: (ctx, i) {
                final Product product = products.items[i];
                return UserProductItem(
                  productId: product.id,
                  title: product.title,
                  imageUrl: product.imageUrl,
                );
              },
              separatorBuilder: (ctx, i) => Divider(),
            ),
          ),
        ),
      ),
      drawer: AppDrawer(),
    );
  }
}
