import 'dart:convert';
import 'dart:developer';

import 'package:bag_shop/firebase_products/products_model.dart';
import 'package:dio/dio.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DataServices extends ChangeNotifier {
  DataServices() {
    // fetchDataApi();
    readData();
  }

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
    //http request => Standard Request
    var response = await http.get(Uri.parse(
        'https://shoppingapp-e3f50-default-rtdb.firebaseio.com/Products.json')); //Use converter to make access on URl

    var data = jsonDecode(response.body) as Map<String, dynamic>;

    log(data.toString());

    for (var element in data.keys) {
      products.add(ProductsDetails.fromJson(data[element]));
    }

    //!Dio request => Custom Request
    var snapshot = await Dio().get(
        'https://shoppingapp-e3f50-default-rtdb.firebaseio.com/Products.json'); // Directly access on URL

    var jsonData = snapshot.data as Map<String, dynamic>;

    for (var element in jsonData.keys) {
      productsV2.add(ProductsDetails.fromJson(jsonData[element]));
    }

    notifyListeners();
  }

  //TODO Create Fetch Using Sdk

  Future<void> readData() async {
    var snapshot =
        await FirebaseDatabase.instance.ref().child('Products').get();

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
