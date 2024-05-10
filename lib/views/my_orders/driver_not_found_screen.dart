import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/app_images.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:get/get.dart';

import '../widgets/reusable_appbar.dart';
import '../widgets/reusable_elevated_button.dart';
import 'cancel_order_screen.dart';

class DriverNotFoundScreen extends StatelessWidget {
  const DriverNotFoundScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: const ReusableAppBar('Error'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(AppImages.driverNotFoundImage),
          ),
          SizedBox(height: size.height * 0.02),
          reusableText('Sorry!😢', null),
          SizedBox(height: size.height * 0.01),
          reusableText(
              'Driver not found for your survices',
              TextStyle(
                  fontSize: size.width * 0.035, fontWeight: FontWeight.w400)),

          ///
          /// butttons for self pickup and cancel
          //
          SizedBox(height: size.height * 0.1),

          SizedBox(
            width: size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Expanded(
                    child: ReusableElevatedButton(
                        textColor: Colors.black,
                        borderSideColor: Colors.grey.shade600,
                        btnColor: Colors.white,
                        borderRadius: 0,
                        text: 'Cancel',
                        onPressed: () {
                          Get.offAll(() => const CancelOrderScreen());
                        }),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: ReusableElevatedButton(
                      textColor: AppColors.whiteColor,
                      btnColor: AppColors.primaryColor,
                      text: 'Self pickup',
                      borderRadius: 0,
                      buttonTextStyle: TextStyle(
                        fontSize: size.width * 0.035,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'heebo',
                        color: AppColors.whiteColor,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget reusableText(String text, TextStyle? textStyle) {
  return Text(
    text,
    style: textStyle ??
        const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 19,
        ),
  );
}
