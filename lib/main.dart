// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:car_shop/screens/cart_screen.dart';
import 'package:car_shop/screens/manage_product_screen.dart';
import 'package:car_shop/screens/orders_screen.dart';
import 'package:car_shop/screens/product_detail_screen.dart';
import 'package:car_shop/screens/products_overview_screen.dart';
import 'package:car_shop/screens/user_products_screen.dart';
import 'package:flutter/material.dart';

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
    print("START...");
    await Future.delayed(Duration(seconds: 5));
    print("END...");
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
              ElevatedButton(
                onPressed: () {
                  waitAsync();
                },
                child: Text("Start Process"),
              ),
              SizedBox(height: 30),
              CircularProgressIndicator()
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
