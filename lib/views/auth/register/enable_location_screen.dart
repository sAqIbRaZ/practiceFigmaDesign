import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/views/auth/register/choose_location_screen.dart';
import 'package:food_delivery_app/widgets/reusable_elevated_button.dart';
import 'package:get/get.dart';

import '../../../utils/app_images.dart';

class EnableLocationScreen extends StatelessWidget {
  const EnableLocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.025),
        child: Column(
          children: [
            SizedBox(height: size.height * 0.1),
            Center(child: Image.asset(AppImages.locationService)),
            SizedBox(height: size.height * 0.05),
            Text(
              'Enable your location',
              style: TextStyle(
                  fontFamily: 'heebo',
                  fontWeight: FontWeight.w500,
                  fontSize: size.height * 0.034),
            ),
            SizedBox(height: size.height * 0.01),
            Text(
              'Allow location on you phone for accurate service\n delivery. My Ace will locate you anytime.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'heebo',
                  fontWeight: FontWeight.w400,
                  color: Colors.grey.shade600,
                  fontSize: size.height * 0.016),
            ),
            SizedBox(height: size.height * 0.1),

            ///
            /// share your current location
            //

            ElevatedButton(
              onPressed: () {
                print('share your current loction');
                Get.to(const ChooseLocationScreen());
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
                backgroundColor: AppColors.primaryColor,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 9.0, horizontal: 32),
                child: Row(
                  children: [
                    SizedBox(
                      height: 22,
                      width: 22,
                      child: Image.asset(
                        AppImages.locationIcon,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'Share current location',
                      style: TextStyle(
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w500,
                          fontSize: size.height * 0.02,
                          fontFamily: 'heebo'),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: size.height * 0.03),

            SizedBox(
              width: double.infinity,
              child: ReusableElevatedButton(
                textColor: AppColors.primaryColor,
                btnColor: AppColors.whiteColor,
                text: 'Enter address manually',
                onPressed: () {
                  print('Enter address manually');
                },
                borderSideColor: AppColors.primaryColorLow2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
