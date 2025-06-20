// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';
import 'package:car_shop/models/order_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderItem extends StatefulWidget {
  final OrderItemModel orderItem;
  const OrderItem({super.key, required this.orderItem});

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    void _toggleExpand() {
      setState(() {
        _expanded = !_expanded;
      });
    }

    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text(
                "\$${NumberFormat("#,###").format(widget.orderItem.amount)}"),
            subtitle: Text(
                '${DateFormat("MM-dd-yyyy: HH:mm").format(widget.orderItem.time)}'),
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: _toggleExpand,
            ),
          ),
          if (_expanded)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              height: min(4 * 20 + 20, 180),
              child: ListView.builder(
                itemCount: widget.orderItem.cartProducts.length,
                itemBuilder: (ctx, i) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.orderItem.cartProducts[i].title,
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "${widget.orderItem.cartProducts[i].quantity} x ${NumberFormat("#,###").format(widget.orderItem.cartProducts[i].price)}",
                      style: TextStyle(fontSize: 20, color: Color(0xff375E97)),
                    ),
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}
