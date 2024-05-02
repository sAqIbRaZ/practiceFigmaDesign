import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/utils/app_images.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/views/auth/register/sign_up.dart';
import 'package:food_delivery_app/views/auth/sign_in_screen/sign_in_screen.dart';
import 'package:get/get.dart';

import '../../../widgets/reusable_elevated_button.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: size.height * 0.1),
          Padding(
            padding: EdgeInsets.only(left: size.height * 0.031),
            child: Text(
              'Welcom to My Ace app',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontFamily: 'heebo',
                  color: AppColors.whiteColor,
                  fontSize: size.height * 0.032),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: size.height * 0.031),
            child: Text(
              'We run the city errands for you',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: 'heebo',
                  color: AppColors.whiteColor,
                  fontSize: size.height * 0.02),
            ),
          ),

          ///
          /// images with circle avatar
          //

          SizedBox(height: size.height * 0.04),

          // continue from here

          Flexible(
            child: Stack(
              children: [
                Positioned(
                  left: -60,
                  top: 40,
                  child: SizedBox(
                    height: size.height * 0.45,
                    width: size.height * 0.45,
                    child: const CircleAvatar(
                      foregroundImage: AssetImage(
                        AppImages.welcome1,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 180,
                  right: 30,
                  child: SizedBox(
                    height: size.height * 0.28,
                    width: size.height * 0.23,
                    child: const CircleAvatar(
                      foregroundImage: AssetImage(AppImages.walkthrough2),
                    ),
                  ),
                )
              ],
            ),
          ),

          ///
          ///  Create account and sign in button
          ///
          //
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.height * 0.028),
            child: SizedBox(
              width: double.infinity,
              child: ReusableElevatedButton(
                text: 'Create account',
                textColor: AppColors.primaryColor,
                btnColor: AppColors.whiteColor,
                onPressed: () {
                  Get.off(() => SignUpScreen());
                },
                borderSideColor: AppColors.whiteColor,
              ),
            ),
          ),
          SizedBox(height: size.height * 0.026),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.height * 0.028),
            child: SizedBox(
              width: double.infinity,
              child: ReusableElevatedButton(
                text: 'Sign in',
                textColor: AppColors.whiteColor,
                btnColor: AppColors.primaryColor,
                borderSideColor: Colors.white70,
                onPressed: () {
                  Get.off(() => SignInScreen());
                },
              ),
            ),
          ),
          SizedBox(height: size.height * 0.05),
        ],
      ),
    );
  }
}
