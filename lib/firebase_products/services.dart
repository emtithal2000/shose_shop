import 'dart:convert';

import 'package:bag_shop/firebase_products/products_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class DataServices extends ChangeNotifier {
  DataServices() {
    // fetchDataApi();
    readData();
  }
  final refPath = FirebaseDatabase.instance.ref().child('Products');

  int currentIndex = 0;
  int i = 0;
  int isAdd = 0;

  double subTotal = 0;
  int count = 0;
  double tax = 0.05;
  double delivery = 5;
  double total = 0;

  List<ProductsDetails> products = [];
  List<ProductsDetails> productsV2 = [];
  List<ProductsDetails> cart = [];

  changeI(int newI) {
    i = newI;
    notifyListeners();
  }

  String convertPath(String path) {
    int startIndex = path.indexOf('/s');

    return path.substring(startIndex + 1);
  }

  addToCart(ProductsDetails details) {
    tax = 0.05; //!reset the value
    cart.add(details);
    count = cart.length;
    tax *= count;
    subTotal += double.parse(details.price ?? '');
    total = subTotal + tax + delivery;
    notifyListeners();
  }

  removeFromCart(ProductsDetails details) {
    tax = 0.05; //!reset the value
    cart.remove(details);
    count = cart.length;
    tax *= count;
    subTotal -= double.parse(details.price ?? '');
    total = subTotal + tax + delivery;
    notifyListeners();
  }

  void fetchDataApi() async {
    var response = await get(Uri.parse(
        'https://shoppingapp-e3f50-default-rtdb.firebaseio.com/Products.json'));

    var data = jsonDecode(response.body) as Map<String, dynamic>;

    for (var element in data.keys) {
      products.add(ProductsDetails.fromJson(data[element]));
    }

    notifyListeners();
  }

  //TODO Create Fetch Using Sdk

  Future<void> readData() async {
    DatabaseReference ref = FirebaseDatabase.instance.ref();
    var snapshot = await ref.child('Products').get();

    // var snapshot2 = await refPath.get();

    for (var element in snapshot.children) {
      productsV2.add(
        ProductsDetails(
          name: element.child('Name').value.toString(),
          price: element.child('Price').value.toString(),
          image: element.child('Image').value.toString(),
        ),
      );
    }

    notifyListeners();
  }
}
