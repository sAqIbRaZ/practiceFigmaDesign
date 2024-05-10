import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/app_images.dart';
import 'package:food_delivery_app/views/home_screen/first_home_screen.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';
import '../widgets/reusable_elevated_button.dart';

class CancelOrderScreen extends StatelessWidget {
  const CancelOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(AppImages.cancelOrderScreenImage),
            ),
            SizedBox(height: size.height * 0.04),
            reusableText('Your order has been cancelled.', null),
            SizedBox(height: size.height * 0.02),
            reusableText(
                'No Driver is Available Right Now!',
                TextStyle(
                    fontSize: size.width * 0.035, fontWeight: FontWeight.w400)),
            SizedBox(height: size.height * 0.11),
            SizedBox(
              width: size.width,
              child: ReusableElevatedButton(
                textColor: AppColors.whiteColor,
                btnColor: AppColors.primaryColor,
                text: 'Ok',
                onPressed: () {
                  Get.offAll(() => FirstHomeScreen());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget reusableText(String text, TextStyle? textStyle) {
  return Text(
    text,
    style: textStyle ??
        const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
  );
}
