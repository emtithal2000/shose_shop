import 'package:bag_shop/size_config.dart';
import 'package:bag_shop/values.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Column(
            children: [
              const Text(
                'Cart',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
              GridView.builder(
                itemCount: cart.length,
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
                              cart[index].shoesImg,
                              fit: BoxFit.cover,
                              height: 100,
                            ),
                          ),
                          const Gap(15),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              cart[index].shoesName,
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
                                cart[index].shoesPrice.toString(),
                              ),
                              InkWell(
                                onTap: () {
                                  subtotal -= cart[index].shoesPrice;
                                  setState(() {
                                    cart.removeAt(index);
                                  });
                                  delivery = cart.length * 0.07;
                                  total = subtotal + delivery;
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
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: getProportionateScreenHeight(250),
              clipBehavior: Clip.hardEdge,
              margin: EdgeInsets.symmetric(
                vertical: getProportionateScreenHeight(80),
                horizontal: getProportionateScreenWidth(20),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.grey,
                      padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(25),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          buildDetails(
                              'Subtotal', '${subtotal.toStringAsFixed(2)}\$'),
                          const Gap(5),
                          buildDetails(
                              'Delivery', '${delivery.toStringAsFixed(2)}\$'),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                    thickness: 3,
                    height: getProportionateScreenHeight(3),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.amber,
                      padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(25),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          buildDetails(
                              'Total', '${total.toStringAsFixed(2)}\$'),
                          Gap(
                            getProportionateScreenHeight(25),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: ListTile(
                              contentPadding: EdgeInsets.only(
                                left: getProportionateScreenWidth(100),
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
          ),
        ],
      ),
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
