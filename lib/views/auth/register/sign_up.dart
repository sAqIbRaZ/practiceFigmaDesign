import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/api_services.dart';
import 'package:food_delivery_app/models/validations.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/views/auth/register/verifyEmailScreen.dart';
import 'package:food_delivery_app/views/auth/sign_in_screen/sign_in_screen.dart';
import 'package:get/get.dart';

import '../../../controllers/auth_controller/auth_controller.dart';
import '../../../models/auth_models/register_user_model.dart';
import '../../widgets/reusable_elevated_button.dart';
import '../../widgets/reusable_textfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // final authController = Get.put(AuthController());

  String userPhoneNumber = '';

  // final TextEditingController firstNameController = TextEditingController();
  //
  // final TextEditingController lastNameController = TextEditingController();
  //
  // final TextEditingController emailController = TextEditingController();
  //
  // final TextEditingController passwordController = TextEditingController();
  //
  // final TextEditingController confirmPasswordController =
  //     TextEditingController();
  //
  // TextEditingController phoneNumberController = TextEditingController();

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
                            ReusableTextField(
                              controller: Get.find<AuthController>()
                                  .firstNameSignUpController,
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
                            ReusableTextField(
                              controller: Get.find<AuthController>()
                                  .lastNameSignUpController,
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
                  ReusableTextField(
                    controller:
                        Get.find<AuthController>().emailSignUpController,
                    textFieldColor: AppColors.whiteColor,
                  ),

                  ///
                  /// country and phone
                  ///
                  ///
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
                    controller:
                        Get.find<AuthController>().phoneNumberSignUpController,
                    onTap: () {
                      if (Get.find<AuthController>()
                          .userPhoneNumberCode
                          .value
                          .isEmpty) {
                        showCountryPicker(
                          context: context,
                          showPhoneCode:
                              true, // optional. Shows phone code before the country name.
                          onSelect: (Country country) {
                            Get.find<AuthController>()
                                .userPhoneNumberCodeFunction(
                                    '+${country.phoneCode}');

                            Get.find<AuthController>()
                                .phoneNumberSignUpController
                                .text = '+${country.phoneCode}';
                            setState(() {});

                            print(Get.find<AuthController>()
                                .userPhoneNumberCode
                                .value);
                          },
                        );
                      }
                    },
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
                        controller:
                            Get.find<AuthController>().passwordSignUpController,
                        textFieldColor: AppColors.whiteColor,
                        obscureText:
                            Get.find<AuthController>().isObsecurePassword.value,
                        suffixWidget: IconButton(
                          onPressed: () {
                            Get.find<AuthController>()
                                .obscurePasswordFunction();
                          },
                          icon: Icon(Get.find<AuthController>()
                                  .isObsecurePassword
                                  .value
                              ? Icons.visibility_off
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
                        controller: Get.find<AuthController>()
                            .confirmPasswordSignUpController,
                        textFieldColor: AppColors.whiteColor,
                        obscureText: Get.find<AuthController>()
                            .isObsecureConfirmPawwordPassword
                            .value,
                        suffixWidget: IconButton(
                          onPressed: () {
                            Get.find<AuthController>()
                                .obscureConfirmPasswordFunction();
                          },
                          icon: Icon(Get.find<AuthController>()
                                  .isObsecureConfirmPawwordPassword
                                  .value
                              ? Icons.visibility_off
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
                        Get.find<AuthController>().agreeToTermsFunction();
                      },
                      child: Row(
                        children: [
                          Icon(Get.find<AuthController>().agreeToTerms.value
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

                  Obx(() => Center(
                        child: SizedBox(
                          width: Get.find<AuthController>().isRegistering.value
                              ? 30
                              : double.infinity,
                          child: Get.find<AuthController>().isRegistering.value
                              ? const CircularProgressIndicator(
                                  color: Colors.black,
                                )
                              : ReusableElevatedButton(
                                  textColor: AppColors.whiteColor,
                                  btnColor: AppColors.primaryColor,
                                  text: 'Create account',
                                  onPressed: () async {
                                    ///
                                    ///validation
                                    ///

                                    // Get.find<AuthController>()
                                    //     .isRegisteringUserFunction(true);

                                    final isValidationSuccess =
                                        Validation.validateInputFields(
                                            Get.find<AuthController>()
                                                .firstNameSignUpController
                                                .text,
                                            Get.find<AuthController>()
                                                .lastNameSignUpController
                                                .text,
                                            Get.find<AuthController>()
                                                .emailSignUpController
                                                .text,
                                            Get.find<AuthController>()
                                                .passwordSignUpController
                                                .text,
                                            Get.find<AuthController>()
                                                .confirmPasswordSignUpController
                                                .text,
                                            Get.find<AuthController>()
                                                .phoneNumberSignUpController
                                                .text,
                                            Get.find<AuthController>()
                                                .agreeToTerms
                                                .value);

                                    if (isValidationSuccess) {
                                      Get.find<AuthController>().register();
                                    }
                                  },
                                ),
                        ),
                      )),

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
