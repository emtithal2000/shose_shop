import 'package:bag_shop/categories.dart';
import 'package:bag_shop/idea/pick_product.dart';
import 'package:bag_shop/models/shoes_model.dart';
import 'package:bag_shop/settings.dart';
import 'package:bag_shop/shopping_cart.dart';
import 'package:flutter/material.dart';

List<String> categories = [
  'New',
  'Women',
  'Brands',
  'Best Sellers',
  'Men',
  'Sport ',
  'Formal '
];
List<Icon> drowerIcons = [
  const Icon(Icons.email),
  const Icon(Icons.phone),
  const Icon(Icons.favorite),
  const Icon(Icons.shopping_cart),
  const Icon(Icons.settings),
];
List<String> drowernames = [
  "Email",
  "Phone Number",
  "Favorite",
  "Cart",
  "Settings",
];
var items = [
  const Categories(),
  const PickProducts(), //0
  const Cart(),
  const Settings(), //2
];
double subtotal = 0;
double delivery = 0;
double total = 0;

List<bool> isF = [false, false, false, false, false, false];
List<ShoesModel> cart = [];

List<ShoesModel> shoseData = [
  ShoesModel(
    shoesImg: 'assets/images/shoes.jpg',
    shoesName: 'Comfortable Travel Woman Shoes',
    shoesPrice: 10,
  ),
  ShoesModel(
    shoesImg: 'assets/images/shoes1.jpg',
    shoesName: 'Coolest New Casual Men Shoes',
    shoesPrice: 20,
  ),
  ShoesModel(
    shoesImg: 'assets/images/shoes2.jpg',
    shoesName: 'Nice New Casual Leather Shoes ',
    shoesPrice: 15,
  ),
  ShoesModel(
    shoesImg: 'assets/images/shoes3.jpg',
    shoesName: 'Quality Casual  Shoes',
    shoesPrice: 30,
  ),
  ShoesModel(
    shoesImg: 'assets/images/shoes4.jpg',
    shoesName: 'Men Black High Shoes',
    shoesPrice: 32,
  ),
  ShoesModel(
    shoesImg: 'assets/images/shoes5.jpg',
    shoesName: 'Latest Men Summer Shoes',
    shoesPrice: 35,
  ),
];
