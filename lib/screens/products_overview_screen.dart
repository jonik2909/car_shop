// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:car_shop/providers/products.dart';
import 'package:car_shop/widgets/app_drawer.dart';
import 'package:car_shop/widgets/badge.dart';
import 'package:car_shop/widgets/products_sample.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum FilterOptions { favorites, all }

class ProductsOverviewScreen extends StatefulWidget {
  const ProductsOverviewScreen({super.key});

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  bool _showOnlyFavorites = false;
  bool _isLoading = false;
  @override
  void didChangeDependencies() async {
    setState(() {
      _isLoading = true;
    });

    try {
      Products products = Provider.of<Products>(context, listen: false);

      await products.fetchAndSetProducts();

      setState(() {
        _isLoading = false;
      });
    } catch (err) {
      setState(() {
        _isLoading = false;
      });
    }

    super.didChangeDependencies();
  }

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
            onSelected: (selectedValue) {
              setState(() {
                _showOnlyFavorites = selectedValue == FilterOptions.favorites;
              });
            },
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
          BadgeCard()
        ],
      ),
      drawer: AppDrawer(),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ProductsSample(showFavorites: _showOnlyFavorites),
    );
  }
}
