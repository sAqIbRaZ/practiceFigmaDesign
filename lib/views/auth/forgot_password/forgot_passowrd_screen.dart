import 'package:flutter/material.dart';
import 'package:food_delivery_app/controllers/auth_controller/auth_controller.dart';
import 'package:food_delivery_app/models/api_services.dart';
import 'package:food_delivery_app/utils/app_images.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/custom_toast_message.dart';
import 'package:food_delivery_app/utils/textStyles.dart';
import 'package:food_delivery_app/views/auth/forgot_password/enter_code_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../widgets/reusable_elevated_button.dart';
import '../../widgets/reusable_forgot_password_image_text.dart';
import '../../widgets/reusable_textfield.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);
  // final TextEditingController emailController = TextEditingController();
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
                    ReusableTextField(
                      controller: Get.find<AuthController>()
                          .emailForgetPasswordController,
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
                Obx(() => SizedBox(
                      width: size.width,
                      child: Get.find<AuthController>().isLoading.value
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : ReusableElevatedButton(
                              textColor: AppColors.whiteColor,
                              btnColor: AppColors.primaryColor,
                              text: 'Send Code',
                              onPressed: () async {
                                // Get.lazyPut(() => APIController());
                                // final prefs =
                                //     await SharedPreferences.getInstance();

                                if (Get.find<AuthController>()
                                    .emailForgetPasswordController
                                    .text
                                    .isEmpty) {
                                  showCustomToast('Email is required');
                                  return;
                                }

                                Get.find<AuthController>().forgotPasswordApi();

                                //   Get.find<AuthController>()
                                //       .isLoadingFunction(true);
                                //
                                //   final isCodeSent = await APIServices()
                                //       .forgotPasswordApi(
                                //           Get.find<AuthController>()
                                //               .emailForgetPasswordController
                                //               .text
                                //               .toString());
                                //   if (isCodeSent.isNotEmpty) {
                                //     Get.find<AuthController>()
                                //         .isLoadingFunction(false);
                                //
                                //     Get.find<AuthController>()
                                //         .forgetRequestIdFunction(
                                //             isCodeSent.toString());
                                //
                                //     Get.to(EnterCodeScreen());
                                //   }
                                //   Get.find<AuthController>()
                                //       .isLoadingFunction(false);
                              }),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
