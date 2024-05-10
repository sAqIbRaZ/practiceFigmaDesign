import 'package:flutter/material.dart';
import 'package:food_delivery_app/controllers/auth_controller/auth_controller.dart';
import 'package:food_delivery_app/models/api_services.dart';
import 'package:food_delivery_app/models/auth_models/login_model.dart';
import 'package:food_delivery_app/utils/app_images.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/custom_toast_message.dart';
import 'package:food_delivery_app/views/auth/forgot_password/forgot_passowrd_screen.dart';
import 'package:food_delivery_app/views/auth/register/sign_up.dart';
import 'package:get/get.dart';
import '../../home_screen/first_home_screen.dart';
import '../../widgets/reusable_elevated_button.dart';
import '../../widgets/reusable_textfield.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);

  // final authController = Get.put(AuthController());

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
                  ReusableTextField(
                    controller:
                        Get.find<AuthController>().emailSignInController,
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
                  ReusableTextField(
                    controller:
                        Get.find<AuthController>().passwordSignInController,
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
                        Get.to(ForgotPasswordScreen());
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

              Obx(() => SizedBox(
                    width: double.infinity,
                    child: Get.find<AuthController>().isLoading.value
                        ? const Center(
                            child: CircularProgressIndicator(
                            color: Colors.black,
                          ))
                        : ReusableElevatedButton(
                            textColor: AppColors.whiteColor,
                            btnColor: AppColors.primaryColor,
                            text: 'Sign in',
                            onPressed: () async {
                              ///sign in api
                              //

                              if (Get.find<AuthController>()
                                  .emailSignInController
                                  .text
                                  .isEmpty) {
                                showCustomToast('Email is required');
                              } else if (Get.find<AuthController>()
                                  .passwordSignInController
                                  .text
                                  .isEmpty) {
                                showCustomToast('Passowrd is required');
                              } else {
                                // Get.find<AuthController>()
                                //     .isLoadingFunction(true);

                                // final user = SignInModel(
                                //     email: Get.find<AuthController>()
                                //         .emailSignInController
                                //         .text
                                //         .toString(),
                                //     password: Get.find<AuthController>()
                                //         .passwordSignInController
                                //         .text
                                //         .toString(),
                                //     deviceToken: 'token');
                                // final isLoggedIn =
                                //     await APIServices().signInUserApi(user);

                                // if (isLoggedIn) {
                                //   Get.find<AuthController>()
                                //       .changeCurrentNavBarIndexFunction(0);
                                //   Get.find<AuthController>()
                                //       .isLoadingFunction(false);
                                //
                                //   Get.offAll(() => const FirstHomeScreen());
                                // }
                                // Get.find<AuthController>()
                                //     .isLoadingFunction(false);

                                Get.find<AuthController>().login();
                              }
                            },
                          ),
                  )),

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
                      Get.off(() => const SignUpScreen());
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
