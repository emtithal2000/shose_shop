import 'package:bag_shop/categories.dart';
import 'package:bag_shop/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/background.jpeg",
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  "Find Your Best Collections ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40,
                    height: 1,
                    letterSpacing: 2,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Lobster",
                  ),
                ),
                const Gap(25),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 65, vertical: 13),
                    backgroundColor: const Color(0xff64505b),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUp(),
                      ),
                    );
                  },
                  child: const Text(
                    "Get Started",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Gap(60),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
