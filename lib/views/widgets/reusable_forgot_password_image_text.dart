import 'package:flutter/material.dart';

import '../../utils/textStyles.dart';

class ReusableForgotPasswrordWidget extends StatelessWidget {
  const ReusableForgotPasswrordWidget(
      {Key? key, required this.image, required this.text})
      : super(key: key);
  final String image;
  final String text;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        SizedBox(
          height: size.height * 0.02,
        ),

        // image for forgot password screen1

        Center(
            child: Image.asset(
          image,
          height: size.height * 0.2,
        )),

        ///
        /// text saying enter your email address
        //
        SizedBox(
          height: size.height * 0.09,
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: AppTextStyles.defaultTextStyle.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 13,
              color: Colors.grey.shade600),
        ),
      ],
    );
  }
}
