import 'package:flutter/material.dart';
import 'package:food_delivery_app/controllers/auth_controller/auth_controller.dart';
import 'package:food_delivery_app/models/auth_models/verify_email_model.dart';
import 'package:food_delivery_app/models/api_services.dart';
import 'package:food_delivery_app/models/auth_models/resend_otp_model.dart';
import 'package:food_delivery_app/utils/app_images.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/custom_toast_message.dart';
import 'package:food_delivery_app/utils/textStyles.dart';
import 'package:food_delivery_app/views/auth/register/choose_language.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../widgets/reusable_elevated_button.dart';
import '../../widgets/reusable_forgot_password_image_text.dart';
import '../../widgets/reusable_textfield.dart';

class VerifyEmailScreen extends StatelessWidget {
  VerifyEmailScreen({Key? key}) : super(key: key);
  // final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());

  String otp = "";
  //
  // final List<TextEditingController> listOfControllers =
  //     List.generate(4, (_) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 70,
        title: const Text(
          'Verify Email',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w500, fontFamily: 'heebo'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const ReusableForgotPasswrordWidget(
                  image: AppImages.forgotPassword2,
                  text:
                      'Please enter the 6 digits code sent to your provided email'),

              ///
              /// place to enter code
              //
              SizedBox(height: size.width * 0.1),
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
                        if (value.length == 1 && index < 6) {
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
              /// button to verify
              //
              SizedBox(height: size.width * 0.1),

              SizedBox(
                width: size.width,
                child: ReusableElevatedButton(
                    textColor: AppColors.whiteColor,
                    btnColor: AppColors.primaryColor,
                    text: 'Verify Code',
                    onPressed: () async {
                      // Hit the verify otp api
                      otp = ""; // Reset OTP string on any change
                      for (var controller
                          in Get.find<AuthController>().listOfControllers) {
                        otp += controller.text
                            .toString(); // Build the OTP string dynamically
                      }
                      if (otp.length < 2) {
                        showCustomToast('Enter full otp');
                        return;
                      }

                      final prefs = await SharedPreferences.getInstance();
                      final userId = prefs.getString('userId');
                      print('user id $userId');
                      final verifyEmailModel = VerifyEmailModel(
                          OTP: otp.toString(),
                          userId: userId.toString(),
                          deviceToken: 'token');
                      final isVerified =
                          await APIServices().verifyEmailApi(verifyEmailModel);
                      if (isVerified) {
                        Get.to(() => const ChooseLanguageScreen());
                      }
                    }),
              ),

              ///
              /// Didn't get a code
              //
              SizedBox(
                height: size.height * 0.03,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Didn't get the code?"),
                  const SizedBox(width: 4),
                  InkWell(
                    onTap: () async {
                      /// resend opt api
                      //
                      // final prefs = await SharedPreferences.getInstance();
                      // // print(prefs.getString('userId'));
                      // final data = ResendOtpModel(
                      //     email: prefs.getString('email').toString(),
                      //     userId: prefs.getString('userId').toString());
                      // APIServices().resendOtpApi(data);
                      Get.find<AuthController>().resendEmail();
                    },
                    child: Text(
                      'Resend',
                      style: AppTextStyles.defaultTextStyle.copyWith(
                          decoration: TextDecoration.underline,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          height: 2),
                    ),
                  )
                ],
              ),
            ],
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
