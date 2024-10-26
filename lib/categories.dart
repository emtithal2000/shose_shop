import 'package:bag_shop/firebase_products/services.dart';
import 'package:bag_shop/size_config.dart';
import 'package:bag_shop/values.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:provider/provider.dart';

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
    return Consumer<DataServices>(
      builder: (context, data, __) {
        return Scaffold(
          extendBody: true,
          appBar: AppBar(
            actions: [
              InkWell(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const Cart(),
                  //   ),
                  // );
                },
                child: Badge.count(
                  count: data.cart.length,
                  child: const Icon(
                    IconsaxPlusLinear.notification,
                    color: Color.fromARGB(218, 100, 80, 91),
                    size: 30,
                  ),
                ),
              ),
              // const Gap(10),
              // const CircleAvatar(
              //     backgroundImage: NetworkImage(
              //         "https://th.bing.com/th/id/R.782adc2b6062ab00461359da5b02b753?rik=Y%2fJZM98TPsfXxA&riu=http%3a%2f%2fwww.pngall.com%2fwp-content%2fuploads%2f5%2fProfile-PNG-File.png&ehk=nJ0Yls4aiMdSvREO5hB2GU7Hc3cL04UQeojwLhvL8Gk%3d&risl=&pid=ImgRaw&r=0")
              //     // AssetImage('assets/images/avatar2.png'),
              //     ),
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
                          color: Color.fromARGB(218, 100, 80, 91),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 34,
                                backgroundImage: NetworkImage(
                                  "https://www.pgoc.lk/wp-content/uploads/2023/11/user.png",
                                ),
                                backgroundColor: Colors.white,
                                // AssetImage('assets/images/avatar2.png'),
                              ),
                              Gap(10),
                              Text(
                                "Emtithal ALjabri",
                                style: TextStyle(
                                    fontFamily: "Noto",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Text(
                                "emtithal@gmail.com",
                                style: TextStyle(
                                    fontFamily: "Noto", color: Colors.white),
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
                        iconColor: const Color(0xff64505b),
                        title: Text(
                          drowernames[index],
                        ),
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
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: width(15)),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Shoes Collections',
                    style: TextStyle(
                      fontSize: 35,
                      // fontWeight: FontWeight.bold,
                      fontFamily: "Lobster",
                      color: Color.fromARGB(218, 100, 80, 91),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        width: 300,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            hintText: 'Find Shoes',
                            hintStyle: const TextStyle(color: Colors.grey),
                            prefixIcon: Container(
                              margin: const EdgeInsets.all(5),
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(218, 100, 80, 91),
                              ),
                              child: Image.asset(
                                'assets/images/search.png',
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Gap(10),
                      const CircleAvatar(
                        radius: 25,
                        backgroundColor: Color.fromARGB(218, 100, 80, 91),
                        child: Icon(
                          Icons.settings_voice,
                          color: Color.fromARGB(255, 226, 224, 224),
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(8),
                SizedBox(
                  height: height(45),
                  child: ListView.separated(
                    itemCount: categories.length,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      horizontal: width(8),
                    ),
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: width(15),
                      );
                    },
                    itemBuilder: (context, index) {
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
                              fontSize: 20,
                              fontWeight: i == index
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: index == i
                                  ? const Color(0xff64505b)
                                  : Colors.grey,
                              fontFamily: 'Noto',
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                // Expanded(
                //   child: GridView.builder(
                //     itemCount: shoseData.length,
                //     physics: const BouncingScrollPhysics(),
                //     shrinkWrap: true,
                //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //         crossAxisCount: 2,
                //         crossAxisSpacing: 30,
                //         mainAxisSpacing: 30,
                //         mainAxisExtent: 210),
                //     padding: const EdgeInsets.all(12),
                //     itemBuilder: (context, index) {
                // return Container(
                //   decoration: BoxDecoration(
                //     color: Colors.white,
                //     borderRadius: BorderRadius.circular(20),
                //     boxShadow: const [
                //       BoxShadow(
                //         blurRadius: 8,
                //         spreadRadius: 2,
                //         color: Color.fromARGB(124, 158, 158, 158),
                //       ),
                //     ],
                //   ),
                //   child: Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         Card(
                //           shadowColor: Colors.grey,
                //           elevation: 10,
                //           clipBehavior: Clip.antiAlias,
                //           shape: RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(15),
                //           ),
                //           child: Image.asset(
                //             shoseData[index].shoesImg,
                //             fit: BoxFit.cover,
                //             height: 100,
                //             width: 125,
                //           ),
                //         ),
                //         const Gap(15),
                //         Align(
                //           alignment: Alignment.center,
                //           child: Text(
                //             shoseData[index].shoesName,
                //             textAlign: TextAlign.center,
                //             style: const TextStyle(
                //               fontSize: 13,
                //               fontWeight: FontWeight.bold,
                //             ),
                //           ),
                //         ),
                //         const Gap(15),
                //         Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceAround,
                //           children: [
                //             Text(
                //               '\$${shoseData[index].shoesPrice}',
                //             ),
                //             InkWell(
                //               onTap: () {
                //                 total = 0; //!to delete old price
                //                 setState(() {
                //                   cart.add(shoseData[index]);
                //                   subtotal +=
                //                       shoseData[index].shoesPrice; //10 - 30
                //                   delivery = cart.length * 0.07; //0.07 - 0.14
                //                   total +=
                //                       subtotal + delivery; //10.07 - 40.14
                //                 });
                //               },
                //               child: const Icon(
                //                 Icons.shopping_cart_checkout_rounded,
                //                                      color: Color.fromARGB(218, 100, 80, 91),

                //               ),
                //             ),
                //           ],
                //         ),
                //       ],
                //     ),
                //   ),
                // );
                //     },
                //   ),
                // ),
                SizedBox(
                  height: height(440),
                  child: ListView.separated(
                    itemCount: data.productsV2.length,
                    clipBehavior: Clip.none,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(
                      horizontal: width(5),
                      vertical: height(10),
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 8,
                              spreadRadius: 2,
                              color: Color.fromARGB(124, 158, 158, 158),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(height(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Card(
                                shadowColor: Colors.grey,
                                elevation: 10,
                                clipBehavior: Clip.antiAlias,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Image.asset(
                                  'assets/images/${data.productsV2[index].image}',
                                  fit: BoxFit.cover,
                                  height: height(280),
                                  width: width(210),
                                ),
                              ),
                              Gap(height(13)),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  shoseData[index].shoesName,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: width(15),
                                    fontWeight: FontWeight.bold,
                                    color:
                                        const Color.fromARGB(218, 100, 80, 91),
                                    fontFamily: "Noto",
                                  ),
                                ),
                              ),
                              Gap(height(20)),
                              Row(
                                children: [
                                  Text(
                                    '\$${shoseData[index].shoesPrice}',
                                    style: TextStyle(
                                      fontSize: width(15),
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const Gap(110),
                                  InkWell(
                                    onTap: () {
                                      data.addToCart(data.productsV2[index]);
                                    },
                                    child: const CircleAvatar(
                                      radius: 23,
                                      backgroundColor:
                                          Color.fromARGB(218, 100, 80, 91),
                                      child: Icon(
                                        Icons.add,
                                        color:
                                            Color.fromARGB(255, 226, 224, 224),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Gap(25);
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
