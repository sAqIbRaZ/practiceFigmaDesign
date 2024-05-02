import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/colors.dart';

class WalkthroughButtons extends StatelessWidget {
  WalkthroughButtons(
      {required this.onPressedSkip, required this.onPressedNext});
  final void Function()? onPressedSkip;
  final void Function()? onPressedNext;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
            onPressed: onPressedSkip,
            child: Text(
              'Skip',
              style: TextStyle(
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  fontFamily: 'heebo'),
            )),
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: ElevatedButton(
            onPressed: onPressedNext,
            child: const Text(
              'Next',
              style: TextStyle(
                  color: AppColors.whiteColor,
                  fontFamily: 'heebo',
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
              backgroundColor: AppColors.primaryColor,
            ),
          ),
        )
      ],
    );
  }
}
