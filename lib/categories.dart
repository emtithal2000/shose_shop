import 'package:bag_shop/size_config.dart';
import 'package:bag_shop/values.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'shopping_cart.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int currentIndex = 0;
  int i = 0;
  int isAdd = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Cart(),
                ),
              );
            },
            child: const Icon(Icons.shopping_cart_checkout_rounded),
          ),
          const Gap(15),
          const CircleAvatar(
            backgroundImage: AssetImage('assets/images/avatar2.png'),
          ),
          const Gap(10),
        ],
      ),
      body: Column(
        children: [
          const Gap(20),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: 45,
              width: 340,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: 'Find Shoes',
                  contentPadding: const EdgeInsets.all(10),
                  prefixIcon: Container(
                    margin: const EdgeInsets.all(4),
                    padding: const EdgeInsets.all(7),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(166, 158, 158, 158)),
                    child: Image.asset(
                      'assets/images/search.png',
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Categories',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
            child: ListView.separated(
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      i = index;
                    });
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  //! Use AnimatedScale to change text scale
                  //! Set text size to fixed size to prevent wrong design
                  child: AnimatedScale(
                    duration: const Duration(milliseconds: 300),
                    scale: i == index ? 1.125 : 1,
                    child: Text(
                      categories[index],
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight:
                            i == index ? FontWeight.bold : FontWeight.normal,
                        color: index == i ? Colors.black : Colors.grey,
                      ),
                    ),
                  ),
                );
              },
              itemBuilder: (context, index) {
                return SizedBox(
                  width: getProportionateScreenWidth(20),
                );
              },
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: shoseData.length,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 30,
                  mainAxisExtent: 210),
              padding: const EdgeInsets.all(25),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 20,
                        spreadRadius: 5,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Card(
                          shadowColor: Colors.grey,
                          elevation: 20,
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.asset(
                            shoseData[index].shoesImg,
                            fit: BoxFit.cover,
                            height: 100,
                          ),
                        ),
                        const Gap(15),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            shoseData[index].shoesName,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Gap(10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              '\$${shoseData[index].shoesPrice}',
                            ),
                            InkWell(
                              onTap: () {
                                total = 0; //!to delete old price
                                setState(() {
                                  cart.add(shoseData[index]);
                                  subtotal +=
                                      shoseData[index].shoesPrice; //10 - 30
                                  delivery = cart.length * 0.07; //0.07 - 0.14
                                  total += subtotal + delivery; //10.07 - 40.14
                                });
                              },
                              child: const Icon(
                                Icons.shopping_cart_checkout_rounded,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
