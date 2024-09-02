import 'package:bag_shop/values.dart';
import 'package:flutter/material.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int index = 0;
  int selectedIndex = 0;

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

      // bottomNavigationBar: CurvedNavigationBar(
      //   items: [
      //     Icon(
      //       Icons.home,
      //       color: index == 0 ? Colors.white : Colors.black,
      //     ),
      //     Icon(
      //       Icons.favorite,
      //       color: index == 1 ? Colors.white : Colors.black,
      //     ),
      //     Icon(
      //       Icons.shopping_cart,
      //       color: index == 2 ? Colors.white : Colors.black,
      //     ),
      //     Icon(
      //       Icons.person,
      //       color: index == 3 ? Colors.white : Colors.black,
      //     ),
      //   ],
      //   onTap: (value) {
      //     setState(() {
      //       index = value;
      //     });
      //   },
      //   buttonBackgroundColor: Colors.grey,
      //   height: 65,
      //   color: Colors.grey,
      //   backgroundColor: Colors.transparent,
      // ),

      bottomNavigationBar: WaterDropNavBar(
        backgroundColor: Colors.transparent,
        onItemSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        selectedIndex: selectedIndex,
        bottomPadding: 8,
        waterDropColor: const Color(0xff3e4267),
        barItems: [
          BarItem(
            filledIcon: Icons.home,
            outlinedIcon: Icons.home_outlined,
          ),
          BarItem(
            filledIcon: Icons.favorite_rounded,
            outlinedIcon: Icons.favorite_border_rounded,
          ),
          BarItem(
            filledIcon: Icons.shopping_cart,
            outlinedIcon: Icons.shopping_cart_outlined,
          ),
          BarItem(
            filledIcon: Icons.person,
            outlinedIcon: Icons.person_2_outlined,
          ),
        ],
      ),
      body: items[index],
    );
  }
}
