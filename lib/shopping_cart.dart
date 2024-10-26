// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bag_shop/firebase_products/services.dart';
import 'package:bag_shop/size_config.dart';
import 'package:bag_shop/values.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DataServices>(
      builder: (context, data, __) {
        return Scaffold(
          appBar: AppBar(
            scrolledUnderElevation: 0,
            elevation: 0,
            backgroundColor: Colors.white,
          ),
          body: Stack(
            children: [
              Column(
                children: [
                  const Text(
                    'Cart',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      color: Color(0xff64505b),
                    ),
                  ),
                  data.cart.isNotEmpty
                      ? SizedBox(
                          height: height(400),
                          child: GridView.builder(
                            itemCount: data.cart.length,
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
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
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Image.asset(
                                          'assets/images/${data.cart[index].image}',
                                          fit: BoxFit.cover,
                                          height: 100,
                                        ),
                                      ),
                                      const Gap(15),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          '${data.cart[index].name}',
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      const Gap(10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            '${data.cart[index].price}',
                                          ),
                                          InkWell(
                                            onTap: () {
                                              data.removeFromCart(
                                                  data.cart[index]);
                                            },
                                            child: const Icon(
                                              Icons.delete_forever_rounded,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                              //     Container(
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
                              //     padding: const EdgeInsets.all(10.0),
                              //     child: Column(
                              //       mainAxisAlignment: MainAxisAlignment.center,
                              //       children: [
                              //         Card(
                              //           shadowColor: Colors.grey,
                              //           elevation: 10,
                              //           clipBehavior: Clip.antiAlias,
                              //           shape: RoundedRectangleBorder(
                              //             borderRadius:
                              //                 BorderRadius.circular(15),
                              //           ),
                              //           child: Image.asset(
                              //             'assets/images/${data.cart[index].image}',
                              //             fit: BoxFit.cover,
                              //             height: 280,
                              //             width: 220,
                              //           ),
                              //         ),
                              //         const Gap(13),
                              //         Align(
                              //           alignment: Alignment.center,
                              //           child: Text(
                              //             '${data.cart[index].name}',
                              //             textAlign: TextAlign.center,
                              //             style: const TextStyle(
                              //               fontSize: 15,
                              //               fontWeight: FontWeight.bold,
                              //               color: Color.fromARGB(
                              //                   218, 100, 80, 91),
                              //               fontFamily: "Noto",
                              //             ),
                              //           ),
                              //         ),
                              //         const Gap(35),
                              //         Row(
                              //           children: [
                              //             Text(
                              //               '${data.cart[index].price}',
                              //               style: const TextStyle(
                              //                   fontSize: 18,
                              //                   // fontWeight: FontWeight.bold,
                              //                   color: Colors.grey),
                              //             ),
                              //             InkWell(
                              //               onTap: () {
                              //                 data.removeFromCart(
                              //                     data.cart[index]);
                              //               },
                              //               child: const Icon(
                              //                   Icons.delete_forever),
                              //             ),
                              //             const Gap(110),
                              //           ],
                              //         ),
                              //       ],
                              //     ),
                              //   ),
                              // );
                            },
                          ),
                        )
                      : Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(
                            top: height(300),
                          ),
                          child: Text(
                            'No Item In Cart',
                            style: TextStyle(
                              fontSize: width(30),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                ],
              ),
              data.cart.isNotEmpty
                  ? Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: height(250),
                        clipBehavior: Clip.hardEdge,
                        margin: EdgeInsets.only(
                          bottom: height(15),
                          left: height(20),
                          right: height(20),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                color: const Color.fromARGB(180, 100, 80, 91),
                                padding: EdgeInsets.symmetric(
                                  horizontal: width(25),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    buildDetails(
                                        'Subtotal', '\$${data.subTotal}'),
                                    const Gap(5),
                                    buildDetails('Count', '${data.count}'),
                                    const Gap(5),
                                    buildDetails('Tax',
                                        '\$${data.tax.toStringAsFixed(2)}'),
                                    const Gap(5),
                                    buildDetails(
                                        'Delivery', '\$${data.delivery}'),
                                  ],
                                ),
                              ),
                            ),
                            Divider(
                              color: Colors.black,
                              thickness: 3,
                              height: height(3),
                            ),
                            Expanded(
                              child: Container(
                                color: const Color.fromARGB(118, 226, 226, 225),
                                padding: EdgeInsets.symmetric(
                                  horizontal: height(25),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    buildDetails('Total', '${data.total}\$'),
                                    Gap(
                                      height(25),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: ListTile(
                                        contentPadding: EdgeInsets.only(
                                          left: height(100),
                                        ),
                                        dense: true,
                                        title: const Text('Pay'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        );
      },
    );
  }

  Row buildDetails(String title, String price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
        ),
        Text(
          price,
        ),
      ],
    );
  }
}
