import 'package:bag_shop/categories.dart';
import 'package:bag_shop/firebase/users_api.dart';
import 'package:bag_shop/firebase_products/firebase_services.dart';
import 'package:bag_shop/firebase_products/products.dart';
import 'package:bag_shop/firebase_products/save_products.dart';
import 'package:bag_shop/login.dart';
import 'package:bag_shop/nav_bar.dart';
import 'package:bag_shop/size_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UsersApi(),
        ),
        ChangeNotifierProvider(
          create: (context) => FirebaseServices(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const SaveProducts(),
    );
  }
}
