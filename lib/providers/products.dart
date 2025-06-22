import 'dart:convert';
import 'dart:io';

import 'package:car_shop/constants/config.dart';
import 'package:car_shop/models/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class Products extends ChangeNotifier {
  // API & STATE
  List<Product> _items = [];

  List<Product> get items {
    return _items;
  }

  List<Product> get favoriteItems {
    return _items.where((product) => product.favorite).toList();
  }

  Future<void> fetchAndSetProducts() async {
    try {
      print("REQUESTING...");
      final url = Uri.parse("$serverApi/car/all");
      final response = await http.get(url);

      final List resultBody = json.decode(response.body);

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

  Future<void> addProduct(Product product) async {
    try {
      final url = Uri.parse("$serverApi/car/create");

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'carTitle': product.title,
          'carPrice': product.price,
          'carDesc': product.description,
          'carImage': product.imageUrl,
        }),
      );

      final body = json.decode(response.body);

      if (response.statusCode == 200) {
        Product newProduct = Product(
          id: body['_id'],
          title: body['carTitle'],
          price: body['carPrice'],
          description: body['carDesc'],
          imageUrl: body['carImage'],
        );

        _items.add(newProduct);
        notifyListeners();
      } else {
        throw body['message'];
      }
    } catch (err) {
      rethrow;
    }
  }

  Future<String?> pickImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        File file = File(image.path);

        // Send to BACKEND
        return await uploadImage(file);
      }
    } catch (err) {
      print("pickImage ERROR: $err");
      rethrow;
    }
  }

  Future<String> uploadImage(File imageFile) async {
    try {
      final uri = Uri.parse("$serverApi/car/upload/image");

      final request = http.MultipartRequest("POST", uri);

      final imageMultipartFile =
          await http.MultipartFile.fromPath('carImage', imageFile.path);

      request.files.add(imageMultipartFile);

      final streamedResponse = await request.send(); // Streamed Response

      final response = await http.Response.fromStream(
          streamedResponse); // Streamed => RESPONSE (body)

      final body = json.decode(response.body);

      if (response.statusCode == 200) {
        return body['path'];
      } else {
        throw body['message'];
      }
    } catch (err) {
      print("Image Upload ERROR: $err");
      rethrow;
    }
  }
}
