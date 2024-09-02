import 'dart:io';

import 'package:bag_shop/firebase_products/firebase_services.dart';
import 'package:bag_shop/firebase_products/products.dart';
import 'package:bag_shop/size_config.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class SaveProducts extends StatefulWidget {
  const SaveProducts({super.key});

  @override
  State<SaveProducts> createState() => _SaveProductsState();
}

class _SaveProductsState extends State<SaveProducts> {
  final name = TextEditingController();
  final price = TextEditingController();
  XFile? image;
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Products(),
              ),
            );
          },
          child: const Text("Add"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const Gap(70),
              InkWell(
                onTap: () async {
                  final picker = ImagePicker();
                  image = await picker.pickImage(source: ImageSource.gallery);
                  setState(() {});
                },
                borderRadius: BorderRadius.circular(100),
                child: CircleAvatar(
                    radius: height(100),
                    backgroundImage: image?.path != null
                        ? FileImage(
                            File(image!.path),
                          )
                        : null,
                    child: image?.path == null
                        ? Text(
                            "Image",
                            style: TextStyle(
                              fontSize: height(35),
                            ),
                          )
                        : null),
              ),
              const Gap(30),
              TextFormField(
                controller: name,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Plase Enter Name';
                  }
                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Name'),
              ),
              const Gap(20),
              TextFormField(
                controller: price,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Plase Enter Price';
                  }
                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Price'),
              ),
              const Gap(20),
              ElevatedButton(
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    Provider.of<FirebaseServices>(context, listen: false)
                        .postData(image!.path, name.text, price.text);
                  }
                },
                child: const Text("add"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
