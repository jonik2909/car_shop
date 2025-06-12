// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';
import 'package:flutter/material.dart';

class OrderItem extends StatefulWidget {
  const OrderItem({super.key});

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
            title: Text("\$123,000"),
            subtitle: Text('${DateTime.now()}'),
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
                itemCount: 3,
                itemBuilder: (ctx, i) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "BMW M5",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "1 x 123,000",
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
