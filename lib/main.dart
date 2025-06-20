// ignore_for_file: prefer_const_constructors

import 'package:car_shop/providers/cart.dart';
import 'package:car_shop/providers/products.dart';
import 'package:car_shop/screens/cart_screen.dart';
import 'package:car_shop/screens/manage_product_screen.dart';
import 'package:car_shop/screens/orders_screen.dart';
import 'package:car_shop/screens/product_detail_screen.dart';
import 'package:car_shop/screens/products_overview_screen.dart';
import 'package:car_shop/screens/user_products_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (ctx) => Products(),
      ),
      ChangeNotifierProvider(
        create: (ctx) => Cart(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Color(0xff375E97)),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: ProductsOverviewScreen(),
      routes: {
        ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
        CartScreen.routeName: (ctx) => CartScreen(),
        OrdersScreen.routeName: (ctx) => OrdersScreen(),
        UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
        ManageProductScreen.routeName: (ctx) => ManageProductScreen(),
      },
    );
  }
}
