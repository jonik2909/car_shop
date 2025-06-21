// ignore_for_file: prefer_const_constructors

import 'package:car_shop/providers/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ManageProductScreen extends StatefulWidget {
  static const routeName = '/manage-product';
  const ManageProductScreen({super.key});

  @override
  State<ManageProductScreen> createState() => _ManageProductScreenState();
}

class _ManageProductScreenState extends State<ManageProductScreen> {
  final _form = GlobalKey<FormState>();

  String? _validateTitle(String? value) {
    if (value == null || value.isEmpty) {
      return "The value should not be empty";
    } else if (value.length < 1) {
      return "The title should be at least four letters long";
    } else if (value.length > 15) {
      return "The title should not be more than fifteen letters long";
    }

    return null;
  }

  String? _validatePrice(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter the price amount";
    } else if (int.tryParse(value) == null) {
      return "Please enter a valid number";
    } else if (int.parse(value) <= 0) {
      return "Please enter an amount greater than zero";
    }

    return null;
  }

  String? _validateDescription(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter a description";
    } else if (value.length < 4) {
      return "The description should have at least 4 charachters";
    }

    return null;
  }

  void _saveForm() async {
    if (!_form.currentState!.validate()) {
      return;
    }
    _form.currentState!.save();

    print("REQUEST TO BACKEND");
  }

  Future<void> _pickAndSetImage() async {
    final Products products = Provider.of<Products>(context, listen: false);

    final String? url = await products.pickImage();

    print("url $url");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Create Product",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveForm,
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _form,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: "title",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 1),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2),
                  ),
                ),
                // initialValue: "TITLE",
                textInputAction: TextInputAction.next,
                validator: _validateTitle,
                onSaved: (value) {
                  print("Title Value $value");
                },
              ),
              SizedBox(height: 15),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "price",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 1),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2),
                  ),
                ),
                // initialValue: "PRICE",
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                validator: _validatePrice,
                onSaved: (value) {
                  print("price Value $value");
                },
              ),
              SizedBox(height: 25),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "description",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 1),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2),
                  ),
                ),
                // initialValue: "DESCRIPTION",
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                validator: _validateDescription,
                onSaved: (value) {
                  print("description Value $value");
                },
              ),
              SizedBox(height: 30),
              GestureDetector(
                onTap: () async {
                  await _pickAndSetImage();
                },
                child: Image.asset('lib/assets/upload_img.png',
                    width: double.infinity, height: 200, fit: BoxFit.cover),
              )
            ],
          ),
        ),
      ),
    );
  }
}
