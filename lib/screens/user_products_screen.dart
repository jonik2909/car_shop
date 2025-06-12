// ignore_for_file: prefer_const_constructors

import 'package:car_shop/widgets/app_drawer.dart';
import 'package:car_shop/widgets/user_product_item.dart';
import 'package:flutter/material.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user-products';

  const UserProductsScreen({super.key});

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
              print("go to Create Product!");
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.separated(
          itemCount: 5,
          itemBuilder: (ctx, i) => UserProductItem(),
          separatorBuilder: (ctx, i) => Divider(),
        ),
      ),
      drawer: AppDrawer(),
    );
  }
}
