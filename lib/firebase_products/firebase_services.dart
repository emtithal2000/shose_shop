import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class FirebaseServices extends ChangeNotifier {
  int counter = 0;
  Future<void> postData(String imagePath, String name, String price) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref();
    var response = await ref.child('Products').get();
    counter = response.children.length;

    await ref.child('Products/Product$counter').set({
      'Image': imagePath,
      'Name': name,
      'Price': price,
    });
    counter++;
    notifyListeners();
  }
}
