import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/views/auth/register/choose_language.dart';
import 'package:food_delivery_app/views/auth/sign_in_screen/sign_in_screen.dart';
import 'package:food_delivery_app/widgets/reusable_elevated_button.dart';
import 'package:food_delivery_app/widgets/reusable_textfield.dart';
import 'package:get/get.dart';

import '../../../controllers/auth_controller/auth_controller.dart';
import '../../../utils/app_images.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.07),
              child: Center(
                child: Text(
                  'Create account',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: 'heebo',
                      fontSize: size.height * (32 / 896)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Center(
                child: Text(
                  'Create My Ace account!',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: 'heebo',
                      fontSize: size.height * (16 / 896)),
                ),
              ),
            ),

            ///
            ///
            ///  Column to take all details to register
            ///
            //

            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.height * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                'First Name',
                                style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontFamily: 'heebo',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12),
                              ),
                            ),
                            const ReusableTextField(
                              textFieldColor: AppColors.whiteColor,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: size.height * 0.024),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                'Last Name',
                                style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontFamily: 'heebo',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12),
                              ),
                            ),
                            const ReusableTextField(
                              textFieldColor: AppColors.whiteColor,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  ///
                  ///Email
                  //

                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      'Email',
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontFamily: 'heebo',
                          fontWeight: FontWeight.w400,
                          fontSize: 12),
                    ),
                  ),
                  const ReusableTextField(
                    textFieldColor: AppColors.whiteColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      'Phone',
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontFamily: 'heebo',
                          fontWeight: FontWeight.w400,
                          fontSize: 12),
                    ),
                  ),
                  ReusableTextField(
                    prefixWidget: Image.asset(AppImages.pakistaniFlag),
                    keyboardType: TextInputType.number,
                    textFieldColor: AppColors.whiteColor,
                  ),

                  ///
                  ///create password
                  //
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      'Create password',
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontFamily: 'heebo',
                          fontWeight: FontWeight.w400,
                          fontSize: 12),
                    ),
                  ),
                  Obx(() => ReusableTextField(
                        textFieldColor: AppColors.whiteColor,
                        obscureText: authController.isObsecurePassword.value,
                        suffixWidget: IconButton(
                          onPressed: () {
                            authController.obscurePasswordFunction();
                          },
                          icon: Icon(authController.isObsecurePassword.value
                              ? CupertinoIcons.eye
                              : Icons.remove_red_eye_outlined),
                        ),
                      )),

                  ///
                  ///confirm password
                  //
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      'Confirm password',
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontFamily: 'heebo',
                          fontWeight: FontWeight.w400,
                          fontSize: 12),
                    ),
                  ),
                  Obx(() => ReusableTextField(
                        textFieldColor: AppColors.whiteColor,
                        obscureText: authController
                            .isObsecureConfirmPawwordPassword.value,
                        suffixWidget: IconButton(
                          onPressed: () {
                            authController.obscureConfirmPasswordFunction();
                          },
                          icon: Icon(authController
                                  .isObsecureConfirmPawwordPassword.value
                              ? CupertinoIcons.eye
                              : Icons.remove_red_eye_outlined),
                        ),
                      )),

                  ///
                  /// agree to terms and condititons
                  //
                  SizedBox(height: size.height * 0.025),
                  Obx(
                    () => InkWell(
                      onTap: () {
                        authController.agreeToTermsFunction();
                      },
                      child: Row(
                        children: [
                          Icon(authController.agreeToTerms.value
                              ? Icons.check_box
                              : Icons.check_box_outline_blank),
                          const SizedBox(width: 8),
                          const Text(
                            'I agree to ',
                            style: TextStyle(fontFamily: 'heebo'),
                          ),
                          const Text(
                            'Terms & Conditions ',
                            style: TextStyle(
                                fontFamily: 'heebo',
                                height: 0,
                                decoration: TextDecoration.underline),
                          ),
                        ],
                      ),
                    ),
                  ),

                  ///
                  /// Create account buttton
                  //
                  SizedBox(height: size.height * 0.045),

                  SizedBox(
                    width: double.infinity,
                    child: ReusableElevatedButton(
                      textColor: AppColors.whiteColor,
                      btnColor: AppColors.primaryColor,
                      text: 'Create account',
                      onPressed: () {
                        Get.to(const ChooseLanguageScreen());
                        // Get.off(() => ChooseLanguageScreen());
                      },
                    ),
                  ),

                  ///
                  /// already on my ace
                  //
                  SizedBox(height: size.height * 0.054),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already on My Ace?',
                        style: TextStyle(
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'heebo'),
                      ),
                      TextButton(
                        child: const Text(
                          'Sign in',
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'heebo'),
                        ),
                        onPressed: () {
                          Get.off(() => SignInScreen());
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
