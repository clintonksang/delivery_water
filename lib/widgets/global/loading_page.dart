import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        
        child: LottieBuilder.asset(
      "assets/lottie/zigzag.json"
      ),
        
         ),
    );
  }
}
