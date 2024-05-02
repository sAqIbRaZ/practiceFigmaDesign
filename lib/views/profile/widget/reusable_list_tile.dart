import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_app/utils/app_images.dart';

class ReusableListTile extends StatelessWidget {
  const ReusableListTile(
      {Key? key, required this.title, required this.imagePath, this.onTap})
      : super(key: key);
  final String title;
  final String imagePath;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(title),
      leading: SvgPicture.asset(imagePath),
      trailing: SvgPicture.asset(AppImages.details_profileSVGIcon),
    );
  }
}
