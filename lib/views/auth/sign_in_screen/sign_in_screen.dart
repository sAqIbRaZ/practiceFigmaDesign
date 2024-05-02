import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/app_images.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/views/auth/forgot_password/forgot_passowrd_screen.dart';
import 'package:food_delivery_app/views/auth/register/sign_up.dart';
import 'package:food_delivery_app/views/home_screen/home_screen.dart';
import 'package:food_delivery_app/widgets/reusable_elevated_button.dart';
import 'package:get/get.dart';

import '../../../widgets/reusable_textfield.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ///
              /// app logo in blue color
              ///
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: size.height * 0.12),
                  child: Image.asset(AppImages.appLogoBlue),
                ),
              ),

              ///
              ///sign in details
              //

              SizedBox(height: size.height * 0.045),

              Text(
                'Sign in',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: 'heebo',
                    fontSize: size.height * 0.037),
              ),
              SizedBox(height: size.height * 0.01),

              Text(
                'Sign in to your account to continue!',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontFamily: 'heebo',
                    fontSize: size.height * 0.02,
                    color: Colors.grey.shade600),
              ),

              // email and password
              SizedBox(height: size.height * 0.035),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Email',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'heebo'),
                  ),
                  SizedBox(height: size.height * 0.012),
                  const ReusableTextField(
                    textFieldColor: AppColors.whiteColor,
                  ),
                  SizedBox(height: size.height * 0.032),
                  const Text(
                    'Password',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'heebo'),
                  ),
                  SizedBox(height: size.height * 0.012),
                  const ReusableTextField(
                    obscureText: true,
                    textFieldColor: AppColors.whiteColor,
                  ),
                ],
              ),

              ///
              /// forgot password
              ///
              //
              SizedBox(height: size.height * 0.01),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(),
                  TextButton(
                      onPressed: () {
                        Get.to(const ForgotPasswordScreen());
                      },
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontFamily: 'heebo',
                            fontWeight: FontWeight.w400),
                      )),
                ],
              ),

              ///
              ///  Sign in button
              //
              SizedBox(height: size.height * 0.018),

              SizedBox(
                width: double.infinity,
                child: ReusableElevatedButton(
                  textColor: AppColors.whiteColor,
                  btnColor: AppColors.primaryColor,
                  text: 'Sign in',
                  onPressed: () {
                    Get.offAll(() => const HomeScreen());
                  },
                ),
              ),

              ///
              /// New to ace create account
              //

              SizedBox(height: size.height * 0.08),

              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'New to My Ace? ',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'heebo',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.off(() => SignUpScreen());
                    },
                    child: const Text(
                      'Create Account',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'heebo',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
