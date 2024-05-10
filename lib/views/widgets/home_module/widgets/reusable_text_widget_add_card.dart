import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/textStyles.dart';

class ReusableTextForAddCard extends StatelessWidget {
  const ReusableTextForAddCard({Key? key, required this.title})
      : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTextStyles.sohniFont.copyWith(
        fontWeight: FontWeight.w300,
        color: AppColors.whiteColor,
      ),
    );
  }
}
