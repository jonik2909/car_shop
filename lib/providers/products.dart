import 'dart:convert';

import 'package:car_shop/constants/config.dart';
import 'package:car_shop/models/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Products extends ChangeNotifier {
  // API & STATE
  List<Product> _items = [];

  List<Product> get items {
    return _items;
  }

  Future<void> fetchAndSetProducts() async {
    try {
      final url = Uri.parse("$serverApi/car/all");
      final response = await http.get(url);

      final List resultBody = json.decode(response.body);
      print(resultBody);

      _items = resultBody.map((item) {
        return Product(
            id: item['_id'],
            title: item['carTitle'],
            description: item['carDesc'],
            price: item['carPrice'], // int => int => string => int
            imageUrl: item['carImage']);
      }).toList();

      notifyListeners();
    } catch (err) {
      print("ERROR, fetchAndSetProducts: $err");
      rethrow;
    }
  }
}
