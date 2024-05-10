import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/textStyles.dart';
import 'package:food_delivery_app/views/home_screen/home_screen.dart';
import 'package:food_delivery_app/views/my_orders/driver_not_found_screen.dart';
import 'package:get/get.dart';

import '../widgets/home_module/widgets/title_widget.dart';

class RateDriverScreen extends StatefulWidget {
  const RateDriverScreen({Key? key}) : super(key: key);

  @override
  State<RateDriverScreen> createState() => _RateDriverScreenState();
}

class _RateDriverScreenState extends State<RateDriverScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Container(
          width: size.width * 0.9,
          height: size.height * 0.52,
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: size.height * 0.03),

                const TitleTextWidget(title: 'Rate the restaurant'),
                SizedBox(height: size.height * 0.01),
                Text(
                  'Tell us your experience',
                  style: TextStyle(
                      fontSize: size.width * 0.03,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey.shade700),
                ),
                SizedBox(height: size.height * 0.03),

                ///
                /// rating for food
                //

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    reusableText('😢\nTerrible'),
                    reusableText('😒\nBad'),
                    reusableText('😉\nOkay'),
                    reusableText('😉\nGood'),
                    reusableText('😊\nGreat'),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Divider(
                    height: 2,
                    color: Colors.grey,
                  ),
                ),

                ///
                /// driver rating
                //
                const TitleTextWidget(title: 'Rate the Driver'),
                SizedBox(height: size.height * 0.01),
                Text(
                  'Tell us your experience',
                  style: TextStyle(
                      fontSize: size.width * 0.03,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey.shade700),
                ),
                SizedBox(height: size.height * 0.03),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    reusableText('😢\nTerrible'),
                    reusableText('😒\nBad'),
                    reusableText('😉\nOkay'),
                    reusableText('😉\nGood'),
                    reusableText('😊\nGreat'),
                  ],
                ),
                SizedBox(height: size.height * 0.03),

                TextButton(
                    onPressed: () {
                      Get.offAll(() => DriverNotFoundScreen());
                    },
                    child: Text(
                      'Skip',
                      style: AppTextStyles.sohniFont
                          .copyWith(color: AppColors.primaryColor),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget reusableText(String title) {
  return Text(
    title,
    textAlign: TextAlign.center,
    style: AppTextStyles.sohniFont.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
  );
}
