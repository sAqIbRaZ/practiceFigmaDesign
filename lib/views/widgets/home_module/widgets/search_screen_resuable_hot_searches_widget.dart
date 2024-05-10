import 'package:flutter/material.dart';

import '../../../../utils/colors.dart';

class HotSearchesWidget extends StatelessWidget {
  const HotSearchesWidget({Key? key, required this.title, this.onTap})
      : super(key: key);
  final String title;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        // height: size.height * 0.04,
        // width: size.width * 0.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColors.primaryColorLow,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Text(
            title,
            style: TextStyle(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w500,
                fontSize: size.width * 0.03),
          ),
        ),
      ),
    );
  }
}
