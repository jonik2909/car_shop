// ignore_for_file: prefer_const_constructors

import 'package:car_shop/constants/config.dart';
import 'package:car_shop/constants/url.dart';
import 'package:car_shop/providers/products.dart';
import 'package:car_shop/screens/manage_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserProductItem extends StatelessWidget {
  final String productId;
  final String title;
  final String imageUrl;

  const UserProductItem(
      {super.key,
      required this.productId,
      required this.title,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final Products products = Provider.of<Products>(context, listen: false);
    return ListTile(
      title: Text(title),
      leading: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.grey,
            width: 2,
          ),
        ),
        child: CircleAvatar(
          backgroundImage: NetworkImage('$serverApi/${imageUrl}'),
        ),
      ),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.of(context).pushNamed(
                  ManageProductScreen.routeName,
                  arguments: productId,
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () async {
                final bool result = await showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: Text("Confirmation"),
                    content: Text("Do you want to delete this product?"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                        child: Text("YES"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        child: Text("NO"),
                      ),
                    ],
                  ),
                );
                print("result: $result");
                if (result) {
                  products.deleteProduct(productId);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
