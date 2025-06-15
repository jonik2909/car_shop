// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:car_shop/screens/cart_screen.dart';
import 'package:car_shop/screens/manage_product_screen.dart';
import 'package:car_shop/screens/orders_screen.dart';
import 'package:car_shop/screens/product_detail_screen.dart';
import 'package:car_shop/screens/products_overview_screen.dart';
import 'package:car_shop/screens/user_products_screen.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter_animate/flutter_animate.dart';

// CORE & EXTERNAL PACKAGE

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  void waitSync() {
    print("START...");
    sleep(Duration(seconds: 5));
    print("END...");
  }

  Future<void> waitAsync() async {
    final random = Random();

    final number = random.nextInt(10);
    print(number);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("UI Freeze")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Hello").animate().fade(), // begin=0, end=1
              Text("Hello").animate().fade(begin: 0.5), // end=1
              Text("Hello").animate().fade(end: 0.5), // begin=1
            ],
          ),
        ),
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         appBarTheme: AppBarTheme(backgroundColor: Color(0xff375E97)),
//         scaffoldBackgroundColor: Colors.white,
//       ),
//       home: ProductsOverviewScreen(),
//       routes: {
//         ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
//         CartScreen.routeName: (ctx) => CartScreen(),
//         OrdersScreen.routeName: (ctx) => OrdersScreen(),
//         UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
//         ManageProductScreen.routeName: (ctx) => ManageProductScreen(),
//       },
//     );
//   }
// }
