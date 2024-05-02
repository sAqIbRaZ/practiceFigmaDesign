import 'package:flutter/material.dart';

class WalkthroughScreens extends StatelessWidget {
  @override
  WalkthroughScreens(
      {required this.image,
      required this.text,
      required this.dotIndicatorPosition});
  final String image;
  final String text;
  final int dotIndicatorPosition;
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            image,
            height: size.height * 0.6,
          ),

          ///
          /// Text
          //
          const SizedBox(height: 60),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'heebo',
                fontWeight: FontWeight.w500,
                fontSize: size.width * 0.056),
          ),

          ///
          ///
          ///
        ],
      ),
    );
  }
}
