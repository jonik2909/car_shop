// ignore_for_file: prefer_const_constructors

import 'package:car_shop/providers/cart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  final String productId;
  final String title;
  final int price;
  final int quantity;

  const CartItem({
    super.key,
    required this.productId,
    required this.title,
    required this.price,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    Cart cart = Provider.of<Cart>(context, listen: false);

    return Dismissible(
      key: ValueKey(productId),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
      ),
      confirmDismiss: (direction) {
        return showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: Text("Are you sure?"),
                  content:
                      Text("Do you want to remove the item from the cart?"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop(true);
                      },
                      child: Text("YES"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop(false);
                      },
                      child: Text("NO"),
                    )
                  ],
                ));
      },
      onDismissed: (direction) {
        print("REMOVE CART ITEM");
        cart.deleteCartItem(productId);
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Color(0xff375E97),
              child: Padding(
                padding: const EdgeInsets.all(3),
                child: FittedBox(
                  child: Text(
                    '\$${NumberFormat("#,###").format(price)}',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            title: Text(title),
            subtitle: Text(
                'Total: \$${NumberFormat("#,###").format(price * quantity)}'),
            trailing: Text(
              "$quantity x",
              style: TextStyle(fontSize: 14),
            ),
          ),
        ),
      ),
    );
  }
}
