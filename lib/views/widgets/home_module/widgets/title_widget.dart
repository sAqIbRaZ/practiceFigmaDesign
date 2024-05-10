import 'package:flutter/material.dart';

class TitleTextWidget extends StatelessWidget {
  const TitleTextWidget({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: size.width * 0.04,
      ),
    );
  }
}
