import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/api_services.dart';
import 'package:food_delivery_app/models/auth_models/create_password_model.dart';
import 'package:food_delivery_app/utils/app_images.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/custom_toast_message.dart';
import 'package:food_delivery_app/utils/textStyles.dart';
import 'package:food_delivery_app/views/auth/sign_in_screen/sign_in_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../controllers/auth_controller/auth_controller.dart';
import '../../widgets/reusable_elevated_button.dart';
import '../../widgets/reusable_forgot_password_image_text.dart';
import '../../widgets/reusable_textfield.dart';

class EnterCodeScreen extends StatelessWidget {
  EnterCodeScreen({Key? key}) : super(key: key);

  String otp = '';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return PopScope(
      onPopInvoked: (didPop) {
        Get.find<AuthController>().isLoadingFunction(false);
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 70,
          title: const Text(
            'Change Password',
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
                    image: AppImages.forgotPassword2,
                    text:
                        'Please enter the 4 digits code sent to your provided email'),

                ///
                /// place to enter code
                //
                // SizedBox(height: size.width * 0.1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    4,
                    (index) => Flexible(
                      child: ReusableTextField(
                        controller:
                            Get.find<AuthController>().listOfControllers[index],
                        focusNode: Get.find<AuthController>().focusNodes[index],
                        textFieldColor: Colors.transparent,
                        borderColor: Colors.transparent,
                        keyboardType: TextInputType.number,
                        hintText: '0',
                        hintTextStyle: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 14),
                        onChanged: (value) {
                          if (value.length == 1 && index < 5) {
                            Get.find<AuthController>()
                                .focusNodes[index + 1]
                                .requestFocus(); // Focus next field
                          }
                        },
                      ),
                    ),
                  ),
                ),

                ///
                /// new password
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
                    ReusableTextField(
                      controller:
                          Get.find<AuthController>().passwordChangeController,
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
                    ReusableTextField(
                      controller: Get.find<AuthController>()
                          .confirmPasswordChangeController,
                      textFieldColor: Colors.transparent,
                      hintText: '*******',
                    ),
                  ],
                ),

                ///
                /// button to verify
                //
                SizedBox(height: size.width * 0.1),

                Obx(() => SizedBox(
                      width: size.width,
                      child: Get.find<AuthController>().isLoading.value
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : ReusableElevatedButton(
                              textColor: AppColors.whiteColor,
                              btnColor: AppColors.primaryColor,
                              text: 'Update Password',
                              onPressed: () async {
                                // Hit the verify otp api
                                // Get.find<AuthController>()
                                //     .isLoadingFunction(true);
                                otp = '';
                                for (int i = 0;
                                    i <
                                        Get.find<AuthController>()
                                            .listOfControllers
                                            .length;
                                    i++) {
                                  otp += Get.find<AuthController>()
                                      .listOfControllers[i]
                                      .text
                                      .toString();
                                }

                                // Get.to(() => CreatePasswordScreen());
                                print('verify code $otp');

                                if (otp.length < 3) {
                                  showCustomToast('Enter full OTP');
                                  // Get.find<AuthController>()
                                  //     .isLoadingFunction(false);
                                  return;
                                } else if (Get.find<AuthController>()
                                        .passwordChangeController
                                        .text
                                        .isEmpty ||
                                    Get.find<AuthController>()
                                        .confirmPasswordChangeController
                                        .text
                                        .isEmpty) {
                                  showCustomToast('Fields are mandatory');
                                  // Get.find<AuthController>()
                                  //     .isLoadingFunction(false);
                                  return;
                                } else if (Get.find<AuthController>()
                                        .passwordChangeController
                                        .text
                                        .isEmpty !=
                                    Get.find<AuthController>()
                                        .confirmPasswordChangeController
                                        .text
                                        .isEmpty) {
                                  showCustomToast('password do not matched');
                                  // Get.find<AuthController>()
                                  //     .isLoadingFunction(false);
                                  return;
                                }

                                // call api here

                                Get.find<AuthController>().createNewPassword();

                                // final prefs =
                                //     await SharedPreferences.getInstance();
                                // final userId =
                                //     prefs.getString('userId').toString();
                                // final newPasswordData = CreatePasswordModel(
                                //     OTP: otp.toString(),
                                //     password: Get.find<AuthController>()
                                //         .passwordChangeController
                                //         .text
                                //         .toString(),
                                //     userId: userId,
                                //     forgetRequestId: Get.find<AuthController>()
                                //         .forgetRequestId
                                //         .value);
                                //
                                // final isPassowrdChanged = await APIServices()
                                //     .createNewPasswordApi(newPasswordData);
                                //
                                // if (isPassowrdChanged) {
                                //   Get.offAll(() => SignInScreen());
                                // }
                                //
                                // Get.find<AuthController>()
                                //     .isLoadingFunction(false);
                              }),
                    )),

                ///
                /// Didn't get a code
                //
                // SizedBox(
                //   height: size.height * 0.03,
                // ),
                //
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     const Text("Didn't get the code?"),
                //     const SizedBox(width: 4),
                //     InkWell(
                //       onTap: () {
                //         print('resend the code');
                //       },
                //       child: Text(
                //         'Resend',
                //         style: AppTextStyles.defaultTextStyle.copyWith(
                //             decoration: TextDecoration.underline,
                //             color: Colors.black,
                //             fontWeight: FontWeight.w400,
                //             height: 2),
                //       ),
                //     )
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget reusableSizedBox(final text) {
  return SizedBox(
    child: ReusableTextField(
      textFieldColor: Colors.transparent,
      borderColor: Colors.transparent,
      keyboardType: TextInputType.number,
      hintText: text,
      hintTextStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
    ),
    height: 34,
    width: 44,
  );
}
