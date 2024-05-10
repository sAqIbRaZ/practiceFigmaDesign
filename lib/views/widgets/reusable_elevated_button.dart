import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/colors.dart';

class ReusableElevatedButton extends StatelessWidget {
  const ReusableElevatedButton(
      {Key? key,
      required this.textColor,
      required this.btnColor,
      required this.text,
      required this.onPressed,
      this.borderRadius = 4,
      this.child,
      this.buttonTextStyle,
      this.borderSideColor = AppColors.primaryColor,
      this.borderStyle = BorderStyle.solid})
      : super(key: key);
  final Color textColor;
  final Color btnColor;
  final String text;
  final Function()? onPressed;
  final Color borderSideColor;
  final BorderStyle borderStyle;
  final TextStyle? buttonTextStyle;
  final double borderRadius;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: BorderSide(
                color: borderSideColor, style: borderStyle, width: 1.5)),
        backgroundColor: btnColor,
      ),
      onPressed: onPressed,
      child: child ??
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3.0),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: buttonTextStyle ??
                  TextStyle(
                      color: textColor,
                      fontFamily: 'heebo',
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
            ),
          ),
    );
  }
}
