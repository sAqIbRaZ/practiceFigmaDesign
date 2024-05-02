import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/app_images.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/textStyles.dart';
import 'package:food_delivery_app/views/home_screen/home_screen.dart';
import 'package:food_delivery_app/widgets/reusable_elevated_button.dart';
import 'package:food_delivery_app/widgets/reusable_forgot_password_image_text.dart';
import 'package:food_delivery_app/widgets/reusable_textfield.dart';
import 'package:get/get.dart';

class CreatePasswordScreen extends StatelessWidget {
  const CreatePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 80,
        title: const Text(
          'Forgot password',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w500, fontFamily: 'heebo'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const ReusableForgotPasswrordWidget(
                  image: AppImages.forgotPassword3,
                  text:
                      'Create a new password and also confirm your\n password'),

              ///
              /// textfield to take input
              ///

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * 0.015,
                  ),
                  Text(
                    'New Password',
                    style: AppTextStyles.defaultTextStyle.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.015,
                  ),
                  const ReusableTextField(
                    textFieldColor: Colors.transparent,
                    hintText: '*******',
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    'Confirm Password',
                    style: AppTextStyles.defaultTextStyle.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.015,
                  ),
                  const ReusableTextField(
                    textFieldColor: Colors.transparent,
                    hintText: '*******',
                  ),
                ],
              ),

              ///
              /// place to enter code
              //
              SizedBox(height: size.width * 0.1),

              SizedBox(
                width: size.width,
                child: ReusableElevatedButton(
                    textColor: AppColors.whiteColor,
                    btnColor: AppColors.primaryColor,
                    text: 'Update Password',
                    onPressed: () {
                      print('verify code');

                      /// move to home screen
                      Get.offAll(() => const HomeScreen());
                    }),
              ),

              ///
              /// Didn't get a code
              //
            ],
          ),
        ),
      ),
    );
  }
}
