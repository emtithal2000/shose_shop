import 'package:flutter/material.dart';

class PickProducts extends StatefulWidget {
  const PickProducts({super.key});

  @override
  State<PickProducts> createState() => _PickProductsState();
}

class _PickProductsState extends State<PickProducts> {
  bool isRed = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedCrossFade(
            crossFadeState:
                isRed ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            firstChild: Image.network(
              'https://www.freepnglogos.com/uploads/women-shoes-png/women-shoes-sergio-rossi-flamenco-red-patent-leather-stilettos-shoe-rate-red-shoes-really-rock-31.png',
              height: 250,
            ),
            secondChild: Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPa8oDsvj6AFDB0TuZZsW5EX03LRuh6FSzAA&s',
              height: 250,
            ),
            duration: const Duration(milliseconds: 500),
          ),
          const Text('Name'),
          const Text('Price'),
          const Text('Brand'),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: isRed ? 25 : 20,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: () {
                      setState(() {
                        isRed = true;
                      });
                    },
                    child: const CircleAvatar(
                      backgroundColor: Colors.red,
                    ),
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: !isRed ? 25 : 20,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: () {
                      setState(() {
                        isRed = false;
                      });
                    },
                    child: const CircleAvatar(
                      backgroundColor: Colors.yellow,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
