// ignore_for_file: prefer_const_constructors

import 'package:car_shop/screens/orders_screen.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          AppBar(
            title: Text(
              "Directions",
              style: TextStyle(color: Colors.white),
            ),
            automaticallyImplyLeading: false,
          ),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text("Go Shop"),
            onTap: () {
              Navigator.of(context).pushReplacementNamed("/");
            },
          ),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text("Go My Orders"),
            onTap: () {
              Navigator.of(context).pushNamed(OrdersScreen.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text("Go Managed Products"),
            onTap: () {
              print('go to Manged Products screen!');
            },
          ),
        ],
      ),
    );
  }
}
