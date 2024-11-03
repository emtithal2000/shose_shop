import 'dart:ui';

import 'package:flutter/material.dart';

class SmokingBackground extends StatelessWidget {
  const SmokingBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/images/shoes1.jpg',
              fit: BoxFit.cover,
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
              child: Container(
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
