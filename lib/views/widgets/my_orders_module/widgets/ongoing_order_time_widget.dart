import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/app_images.dart';
import 'package:food_delivery_app/utils/textStyles.dart';

class OngoingOrderTimeWidget extends StatelessWidget {
  const OngoingOrderTimeWidget(
      {Key? key,
      required this.title,
      required this.subtitle,
      this.trailing,
      this.leading})
      : super(key: key);
  final String title;
  final String subtitle;
  final Widget? trailing;
  final String? leading;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ListTile(
      leading: SizedBox(
          height: size.height * 0.04,
          width: size.width * 0.08,
          child: Image.asset(leading ?? AppImages.orderConfirmed)),
      title: Text(
        title,
        style: AppTextStyles.sohniFont.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: size.width * 0.035,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: AppTextStyles.sohniFont.copyWith(
          fontWeight: FontWeight.w400,
          color: Colors.grey,
          fontSize: size.width * 0.03,
        ),
      ),
      trailing: trailing,
    );
  }
}
