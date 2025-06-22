import 'package:flutter/material.dart';

class Product extends ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final int price;
  final String imageUrl;
  bool favorite;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.favorite = false,
  });

  void toggleFavoriteStatus() {
    favorite == false ? favorite = true : favorite = false;
    notifyListeners();
  }
}
