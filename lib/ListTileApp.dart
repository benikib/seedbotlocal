import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class lottie extends StatelessWidget {
  const lottie({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: [
            // Load a Lottie file from your assets
            Lottie.asset('assets/images/bouton_on.json'),


          ],
        ),
      ),
    );
  }
}