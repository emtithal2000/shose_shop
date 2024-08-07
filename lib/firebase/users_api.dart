import 'dart:convert';

import 'package:bag_shop/models/firebase_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class UsersApi extends ChangeNotifier {
  final _path =
      'https://shoppingapp-e3f50-default-rtdb.firebaseio.com/Users.json';
  List<UserData> users = [];

  Future<void> postData(String username, String password) async {
    await post(
      Uri.parse(_path),
      body: jsonEncode({
        'Username': username,
        'Password': password,
      }),
    );
    notifyListeners();
  }
}
