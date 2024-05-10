import 'package:flutter/material.dart';

import '../../../../utils/textStyles.dart';

class ListTileCheckoutScreen extends StatelessWidget {
  ListTileCheckoutScreen({
    Key? key,
    required this.title,
    required this.trailing_price,
    this.textStyle,
  }) : super(key: key);
  final String title;
  final String trailing_price;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: textStyle ??
              AppTextStyles.sohniFont.copyWith(
                fontWeight: FontWeight.w300,
              ),
        ),
        Text(
          trailing_price,
          style: textStyle ??
              AppTextStyles.sohniFont.copyWith(
                  fontWeight: FontWeight.w300, fontSize: size.width * 0.035),
        ),
      ],
    );
  }
}
