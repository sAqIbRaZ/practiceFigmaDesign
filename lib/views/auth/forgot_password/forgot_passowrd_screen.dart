import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/app_images.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/textStyles.dart';
import 'package:food_delivery_app/views/auth/forgot_password/enter_code_screen.dart';
import 'package:food_delivery_app/widgets/reusable_elevated_button.dart';
import 'package:food_delivery_app/widgets/reusable_forgot_password_image_text.dart';
import 'package:food_delivery_app/widgets/reusable_textfield.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

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
                  image: AppImages.forgotPassword1,
                  text:
                      'Enter your email address to receive a\n verification code'),

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
                    'Email',
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
                    hintText: 'example@gmail.com',
                  ),
                ],
              ),

              ///
              /// button to send confirmation email
              //
              SizedBox(
                height: size.height * 0.052,
              ),
              SizedBox(
                width: size.width,
                child: ReusableElevatedButton(
                    textColor: AppColors.whiteColor,
                    btnColor: AppColors.primaryColor,
                    text: 'Send Code',
                    onPressed: () {
                      print('Code sent');
                      Get.to(const EnterCodeScreen());
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
