import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/app_images.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/textStyles.dart';
import 'package:food_delivery_app/views/auth/forgot_password/create_password_screen.dart';
import 'package:food_delivery_app/widgets/reusable_elevated_button.dart';
import 'package:food_delivery_app/widgets/reusable_forgot_password_image_text.dart';
import 'package:food_delivery_app/widgets/reusable_textfield.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class EnterCodeScreen extends StatelessWidget {
  const EnterCodeScreen({Key? key}) : super(key: key);

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
                  image: AppImages.forgotPassword2,
                  text:
                      'Please enter the 6 digits code sent to example123@cmail.com'),

              ///
              /// place to enter code
              //
              SizedBox(height: size.width * 0.1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  reusableSizedBox('0'),
                  reusableSizedBox('0'),
                  reusableSizedBox('0'),
                  reusableSizedBox('0'),
                  reusableSizedBox('0'),
                  reusableSizedBox('0'),
                ],
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
                    onPressed: () {
                      Get.to(() => CreatePasswordScreen());
                      print('verify code');
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
                    onTap: () {
                      print('resend the code');
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
