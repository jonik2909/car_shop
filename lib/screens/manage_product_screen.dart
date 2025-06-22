// ignore_for_file: prefer_const_constructors

import 'package:car_shop/constants/config.dart';
import 'package:car_shop/models/product.dart';
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

  var _initialData = {
    "title": '',
    "price": '',
    "description": '',
    "imageUrl": '',
  };

  Product _productData = Product(
    id: '',
    title: '',
    description: '',
    price: 0,
    imageUrl: '',
  );

  @override
  void didChangeDependencies() {
    final String? productId =
        ModalRoute.of(context)?.settings.arguments as String?;

    if (productId != null) {
      final Products products = Provider.of<Products>(context, listen: false);
      _productData = products.findByProductId(productId);

      _initialData = {
        "title": _productData.title,
        "price": _productData.price.toString(),
        "description": _productData.description,
        "imageUrl": _productData.imageUrl,
      };
    }
    super.didChangeDependencies();
  }

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

    try {
      final Products product = Provider.of<Products>(context, listen: false);

      if (_productData.id == '') {
        await product.addProduct(_productData);
      } else {
        await product.editProduct(_productData);
      }

      Navigator.of(context).pop();
    } catch (err) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text("ERROR"),
          content: Text("$err"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: Text("OK"),
            )
          ],
        ),
      );
    }
  }

  Future<void> _pickAndSetImage() async {
    final Products products = Provider.of<Products>(context, listen: false);

    final String? url = await products.pickImage();

    print(url);

    if (url != null) {
      setState(() {
        _productData = Product(
          id: _productData.id,
          title: _productData.title,
          description: _productData.description,
          price: _productData.price,
          imageUrl: url,
        );
      });
    }
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
                initialValue: _initialData["title"],
                textInputAction: TextInputAction.next,
                validator: _validateTitle,
                onSaved: (value) {
                  print("Title Value $value");
                  if (value != null) {
                    _productData = Product(
                      id: _productData.id,
                      title: value,
                      description: _productData.description,
                      price: _productData.price,
                      imageUrl: _productData.imageUrl,
                    );
                  }
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
                initialValue: _initialData["price"],
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                validator: _validatePrice,
                onSaved: (value) {
                  print("price Value $value");
                  if (value != null) {
                    _productData = Product(
                      id: _productData.id,
                      title: _productData.title,
                      description: _productData.description,
                      price: int.parse(value),
                      imageUrl: _productData.imageUrl,
                    );
                  }
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
                initialValue: _initialData["description"],
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                validator: _validateDescription,
                onSaved: (value) {
                  print("description Value $value");
                  if (value != null) {
                    _productData = Product(
                      id: _productData.id,
                      title: _productData.title,
                      description: value,
                      price: _productData.price,
                      imageUrl: _productData.imageUrl,
                    );
                  }
                },
              ),
              SizedBox(height: 30),
              GestureDetector(
                onTap: () async {
                  await _pickAndSetImage();
                },
                child: _productData.imageUrl.isEmpty
                    ? Image.asset(
                        'lib/assets/upload_img.png',
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      )
                    : Image.network(
                        '$serverApi/${_productData.imageUrl}',
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
