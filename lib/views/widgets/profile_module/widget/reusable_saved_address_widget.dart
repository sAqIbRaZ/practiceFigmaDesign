import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/app_images.dart';
import '../../../../utils/textStyles.dart';

class ReusableSavedAddressWidget extends StatelessWidget {
  const ReusableSavedAddressWidget(
      {Key? key, required this.title, required this.subtitle})
      : super(key: key);
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: AppTextStyles.sohniFont.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(fontSize: 11),
      ),
      leading: SvgPicture.asset(AppImages.savedAdressesProfileSVGIcon),
      trailing: SvgPicture.asset(AppImages.trailingSavedAddressSVGIcon),
    );
  }
}
