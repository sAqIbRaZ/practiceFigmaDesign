import 'package:flutter/material.dart';

class ReusableTextField extends StatelessWidget {
  const ReusableTextField(
      {Key? key,
      this.obscureText = false,
      this.prefixWidget,
      this.suffixWidget,
      this.hintText = '',
      this.onChanged,
      this.readOnly = false,
      this.hintTextStyle = const TextStyle(
          fontSize: 14, fontFamily: 'heebo', fontWeight: FontWeight.w400),
      this.borderColor = Colors.grey,
      this.textFieldColor,
      this.onTap,
      this.controller,
      this.keyboardType})
      : super(key: key);
  final String hintText;
  final bool obscureText;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final Color? textFieldColor;
  final Color borderColor;
  final TextStyle? hintTextStyle;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final bool readOnly;
  final Function()? onTap;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onTap: onTap,
      readOnly: readOnly,
      obscureText: obscureText,
      keyboardType: keyboardType,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: hintTextStyle,
        fillColor: textFieldColor,
        filled: true,
        prefixIcon: prefixWidget,
        suffixIcon: suffixWidget,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(
              color: borderColor,
              width: 0.6,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(
              color: borderColor,
              width: 0.6,
            )),
      ),
    );
  }
}
