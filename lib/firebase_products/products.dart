import 'package:bag_shop/firebase_products/services.dart';
import 'package:bag_shop/shopping_cart.dart';
import 'package:bag_shop/size_config.dart';
import 'package:bag_shop/values.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DataServices>(
      builder: (context, data, __) {
        return Scaffold(
          appBar: AppBar(
            scrolledUnderElevation: 0,
            elevation: 0,
            backgroundColor: Colors.white,
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
                  backgroundImage: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5_R68mBO19B172Xqr_fg-u1PpR7pa_5xWLg&s")
                  // AssetImage('assets/images/avatar2.png'),
                  ),
              const Gap(10),
            ],
          ),
          drawer: Drawer(
            clipBehavior: Clip.none,
            child: Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    DrawerHeader(
                      margin: EdgeInsets.zero,
                      padding: EdgeInsets.zero,
                      child: Container(
                        width: 500,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(193, 62, 66, 103),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 35,
                                backgroundImage: NetworkImage(
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5_R68mBO19B172Xqr_fg-u1PpR7pa_5xWLg&s"),
                                // AssetImage('assets/images/avatar2.png'),
                              ),
                              Gap(10),
                              Text(
                                "Emtithal ALjabri",
                                style: TextStyle(fontFamily: "Noto"),
                              ),
                              Text(
                                "emtithal@gmail.com",
                                style: TextStyle(fontFamily: "Noto"),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 500,
                  child: ListView.separated(
                    itemCount: drowernames.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: drowerIcons[index],
                        iconColor: const Color(0xff3e4267),
                        title: Text(drowernames[index]),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Gap(15);
                    },
                  ),
                ),
              ],
            ),
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
                          color: Color.fromARGB(193, 62, 66, 103),
                        ),
                        child: Image.asset(
                          'assets/images/search.png',
                          color: Colors.white,
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
                      color: Color(0xff3e4267),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 45,
                child: ListView.separated(
                  itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        data.changeI(index);
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      //! Use AnimatedScale to change text scale
                      //! Set text size to fixed size to prevent wrong design
                      child: AnimatedScale(
                        duration: const Duration(milliseconds: 300),
                        scale: data.i == index ? 1.125 : 1,
                        child: Text(
                          categories[index],
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: data.i == index
                                ? FontWeight.bold
                                : FontWeight.normal,
                            color: index == data.i
                                ? const Color(0xff3e4267)
                                : Colors.grey,
                            fontFamily: 'Noto',
                          ),
                        ),
                      ),
                    );
                  },
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: width(20),
                    );
                  },
                ),
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: data.products.length,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 30,
                    mainAxisSpacing: 30,
                    mainAxisExtent: 210,
                  ),
                  padding: const EdgeInsets.all(25),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 10,
                            spreadRadius: 1,
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
                                'assets/images/${data.products[index].image}',
                                fit: BoxFit.cover,
                                height: 100,
                              ),
                            ),
                            const Gap(15),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                '${data.products[index].name}',
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
                                  '\$${data.products[index].price}',
                                ),
                                InkWell(
                                  onTap: () {
                                    data.addToCart(data.products[index]);
                                  },
                                  child: const Icon(
                                    Icons.add_shopping_cart_rounded,
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
              Gap(height(70)),
            ],
          ),
        );
      },
    );
  }
}
