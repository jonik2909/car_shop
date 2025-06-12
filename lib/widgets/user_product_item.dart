// ignore_for_file: prefer_const_constructors

import 'package:car_shop/constants/url.dart';
import 'package:flutter/material.dart';

class UserProductItem extends StatelessWidget {
  const UserProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("BMW M5"),
      leading: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.grey,
            width: 2,
          ),
        ),
        child: CircleAvatar(
          backgroundImage: NetworkImage(imageUrl),
        ),
      ),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                print("go to Edit screen");
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
                  print("DELETE PRODUCT");
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
