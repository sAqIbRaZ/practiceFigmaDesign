import 'package:flutter/material.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/textStyles.dart';

class ReusableButtonCheckout extends StatelessWidget {
  const ReusableButtonCheckout({Key? key, required this.title, this.onTap})
      : super(key: key);
  final String title;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return InkWell(
      onTap: onTap,
      child: Container(
          // width: size.width * 0.26,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: const Color(0xffFFE1DA)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: AppTextStyles.sohniFont.copyWith(
                  fontSize: size.width * 0.035,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w500),
            ),
          )),
    );
  }
}
