import 'package:bag_shop/values.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      // bottomNavigationBar: MotionTabBar(
      //   initialSelectedTab: "Home",
      //   labels: const ["Profile", "Home", "Cart", "Settings"],
      //   icons: const [
      //     Icons.person,
      //     Icons.home,
      //     Icons.shopping_cart,
      //     Icons.settings
      //   ],
      //   badges: [
      //     const MotionBadgeWidget(
      //         // text: '99+',
      //         // textColor: Colors.white,
      //         // color: Colors.red,
      //         // size: 18,
      //         ),
      //     Container(
      //       // color: Colors.black,
      //       padding: const EdgeInsets.all(2),
      //       // child: const Text(
      //       //   '48',
      //       //   style: TextStyle(
      //       //     fontSize: 14,
      //       //     color: Colors.white,
      //       //   ),
      //       // ),
      //     ),
      //     null,
      //     const MotionBadgeWidget(
      //         // isIndicator: true,
      //         // color: Colors.red,
      //         // size: 5,
      //         // show: true,
      //         ),
      //   ],
      //   tabSize: 50,
      //   tabBarHeight: 55,
      //   textStyle: const TextStyle(
      //     fontSize: 12,
      //     color: Colors.black,
      //     fontWeight: FontWeight.w500,
      //   ),
      //   tabIconColor: Colors.grey,
      //   tabIconSize: 28.0,
      //   tabIconSelectedSize: 26.0,
      //   tabSelectedColor: Colors.grey,
      //   tabIconSelectedColor: Colors.white,
      //   tabBarColor: const Color(0xFFAFAFAF),
      //   onTabItemSelected: (int value) {
      //     setState(() {
      //       index = value;
      //     });
      //   },
      // ),
      bottomNavigationBar: CurvedNavigationBar(
        items: [
          Icon(
            Icons.home,
            color: index == 0 ? Colors.grey : Colors.black,
          ),
          Icon(
            Icons.favorite,
            color: index == 0 ? Colors.grey : Colors.black,
          ),
          Icon(
            Icons.shopping_cart,
            color: index == 0 ? Colors.grey : Colors.black,
          ),
          Icon(
            Icons.person,
            color: index == 0 ? Colors.grey : Colors.black,
          ),
        ],
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        buttonBackgroundColor: Colors.white,
        color: const Color(0xffd0d7d3),
        backgroundColor: Colors.transparent,
      ),
      body: items[index],
    );
  }
}
