import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/app_images.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:get/get.dart';

import '../../../utils/textStyles.dart';
import '../../home_screen/first_home_screen.dart';
import '../../widgets/reusable_elevated_button.dart';
import '../../widgets/reusable_textfield.dart';

class ChooseLocationScreen extends StatelessWidget {
  const ChooseLocationScreen({Key? key}) : super(key: key);

  /// implement location package here from home

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(240, 237, 228, 1),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Choose location',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w600, fontFamily: 'heebo'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: size.height * 0.035),

              // TextField to search for address

              ReusableTextField(
                textFieldColor: AppColors.whiteColor,
                hintText: 'Search address...',
                borderColor: Colors.transparent,
                prefixWidget: const Icon(CupertinoIcons.search),
                suffixWidget: const Icon(Icons.my_location_outlined),
                onChanged: (text) {},
              ),
              // location icon

              SizedBox(
                height: size.height * 0.2,
              ),

              Image.asset(
                AppImages.locationIconRed,
                height: size.height * 0.06,
              ),

              ///
              ///
              /// Card to show selected image
              //
              //
              SizedBox(
                height: size.height * 0.2,
              ),
              SizedBox(
                height: size.height * 0.12,
                width: size.width,
                child: Card(
                  elevation: 6.0,
                  color: AppColors.whiteColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        '',
                        style: AppTextStyles.defaultTextStyle.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                        maxLines: null,
                      ),
                    ),
                  ),
                ),
              ),

              ///
              /// confirm address button
              //
              SizedBox(
                height: size.height * 0.03,
              ),
              SizedBox(
                width: size.width,
                height: size.height * 0.06,
                child: ReusableElevatedButton(
                    textColor: AppColors.whiteColor,
                    btnColor: AppColors.primaryColor,
                    text: 'Confirm address',
                    onPressed: () {
                      Get.offAll(() => FirstHomeScreen());
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
