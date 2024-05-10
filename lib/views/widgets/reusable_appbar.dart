import 'package:flutter/material.dart';

import '../../utils/textStyles.dart';

class ReusableAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ReusableAppBar(this.title, {Key? key}) : super(key: key);
  final String title;

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight); // Set the preferred height

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return AppBar(
      centerTitle: true,
      title: Text(
        title,
        style: AppTextStyles.sohniFont
            .copyWith(fontWeight: FontWeight.w500, fontSize: size.width * 0.05),
      ),
    );
  }
}
