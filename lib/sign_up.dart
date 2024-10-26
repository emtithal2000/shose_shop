import 'package:bag_shop/categories.dart';
import 'package:bag_shop/login.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var username = TextEditingController();
  var password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Gap(130),
            const Text(
              "Sign Up",
              style: TextStyle(
                  fontSize: 50,
                  fontFamily: "Noto",
                  color: Color(0xff64505b),
                  fontWeight: FontWeight.bold),
            ),
            const Gap(80),
            Container(
              padding: const EdgeInsets.all(10),
              height: 58,
              width: 340,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                color: Color(0xfff0eff4),
              ),
              child: TextField(
                controller: username,
                decoration: const InputDecoration(
                  enabledBorder: InputBorder.none,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  hintText: "Username",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            const Gap(30),
            Container(
              padding: const EdgeInsets.all(10),
              height: 58,
              width: 340,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                color: Color(0xfff0eff4),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  enabledBorder: InputBorder.none,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  hintText: "Email",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            const Gap(30),
            Container(
              padding: const EdgeInsets.all(10),
              height: 58,
              width: 340,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                color: Color(0xfff0eff4),
              ),
              child: TextField(
                controller: password,
                decoration: const InputDecoration(
                  enabledBorder: InputBorder.none,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            const Gap(30),
            SizedBox(
              width: 150,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Categories(),
                    ),
                  );
                },
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    Color(0xff64505b),
                  ),
                ),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            const Gap(50),
            const Text(
              "Or",
              style: TextStyle(color: Colors.grey, fontSize: 18),
            ),
            const Gap(50),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Login(),
                    ));
              },
              child: const Text(
                "Already have account?",
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xff64505b),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
