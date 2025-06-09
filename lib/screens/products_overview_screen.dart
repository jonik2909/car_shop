// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:car_shop/widgets/app_drawer.dart';
import 'package:car_shop/widgets/badge.dart';
import 'package:car_shop/widgets/products_sample.dart';
import 'package:flutter/material.dart';

enum FilterOptions { favorites, all }

class ProductsOverviewScreen extends StatelessWidget {
  const ProductsOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "MyShop",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          PopupMenuButton<FilterOptions>(
            onSelected: (selectedValue) {},
            icon: Icon(Icons.more_vert),
            itemBuilder: (ctx) => [
              PopupMenuItem(
                child: Text(
                  "Only favorites",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                value: FilterOptions.favorites,
              ),
              PopupMenuItem(
                child: Text(
                  "Show all",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                value: FilterOptions.all,
              ),
            ],
          ),
          BadgeCard(value: '5')
        ],
      ),
      drawer: AppDrawer(),
      body: ProductsSample(showFavorites: true),
    );
  }
}
