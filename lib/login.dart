import 'package:bag_shop/categories.dart';
import 'package:bag_shop/firebase/users_api.dart';
import 'package:bag_shop/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var username = TextEditingController();
  var password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            const Gap(130),
            const Text(
              "Log In",
              style: TextStyle(
                fontSize: 50,
                fontFamily: "Noto",
                color: Color(0xff3e4267),
                fontWeight: FontWeight.bold,
              ),
            ),
            const Gap(80),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              height: 55,
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
            const Gap(35),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              height: 55,
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
            const Gap(60),
            SizedBox(
              width: 150,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Provider.of<UsersApi>(context, listen: false)
                      .postData(username.text, password.text)
                      .whenComplete(
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Categories(),
                          ),
                        ),
                      );
                },
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    Color(0xff3e4267),
                  ),
                ),
                child: const Text(
                  'log in',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            const Gap(40),
            const Text(
              "Or",
              style: TextStyle(color: Colors.grey, fontSize: 18),
            ),
            const Gap(120),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUp(),
                    ));
              },
              child: const Text(
                "Cteate new account?",
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xff3e4267),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
