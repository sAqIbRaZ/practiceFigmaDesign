import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:food_delivery_app/controllers/home_module/home_controller.dart';
import 'package:food_delivery_app/utils/app_images.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/textStyles.dart';
import 'package:get/get.dart';

import '../../widgets/home_module/widgets/reusable_text_widget_add_card.dart';
import '../../widgets/home_module/widgets/title_widget.dart';
import '../../widgets/reusable_appbar.dart';
import '../../widgets/reusable_elevated_button.dart';
import '../../widgets/reusable_textfield.dart';

class AddCardScreen extends StatelessWidget {
  AddCardScreen({Key? key}) : super(key: key);
  final homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: const ReusableAppBar('Add new card'),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: size.width,
                  height: size.height * 0.29,
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(4)),
                  child: Stack(
                    children: [
                      ///
                      /// headingg credit and debit card
                      //
                      const Positioned(
                          right: 20,
                          top: 16,
                          child:
                              ReusableTextForAddCard(title: 'Credit / Debit')),

                      ///
                      /// card no
                      //
                      const Positioned(
                          left: 20,
                          top: 40,
                          child: ReusableTextForAddCard(title: 'Card number')),

                      ///
                      /// textfield to enter card no
                      //

                      Positioned(
                        top: 64,
                        right: 0,
                        left: 0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: SizedBox(
                            width: size.width,
                            child: const ReusableTextField(
                              textFieldColor: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 80,
                        right: 35,
                        child: Image.asset(AppImages.visaIcon),
                      ),

                      ///
                      /// Expiry date and security code
                      //

                      const Positioned(
                          left: 20,
                          top: 128,
                          child:
                              ReusableTextForAddCard(title: 'Expiration date')),
                      const Positioned(
                          right: 64,
                          top: 128,
                          child:
                              ReusableTextForAddCard(title: 'Security code')),

                      ///
                      /// text field for expiry and security code
                      ///
                      //

                      Positioned(
                        top: 152,
                        left: 20,
                        child: SizedBox(
                          width: size.width * 0.4,
                          child: const ReusableTextField(
                            textFieldColor: AppColors.whiteColor,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 152,
                        right: 20,
                        child: SizedBox(
                          width: size.width * 0.4,
                          child: const ReusableTextField(
                            textFieldColor: AppColors.whiteColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                ///
                /// Card Options
                //

                SizedBox(height: size.height * 0.03),
                const TitleTextWidget(title: 'Card options'),
                SizedBox(height: size.height * 0.01),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Save my card for default payments',
                      style: AppTextStyles.sohniFont.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: size.width * 0.035,
                      ),
                    ),
                    const AdvancedSwitch(
                      activeColor: AppColors.primaryColor,
                      inactiveColor: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      width: 50.0,
                      height: 30.0,
                      enabled: true,
                      disabledOpacity: 0.5,
                    ),
                  ],
                ),
              ],
            ),

            ///
            /// add card button
            ///
            //

            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: SizedBox(
                width: size.width,
                child: ReusableElevatedButton(
                    textColor: AppColors.whiteColor,
                    btnColor: AppColors.primaryColor,
                    text: 'Add card',
                    onPressed: () {
                      homeController.addPaymentCardFunction();
                      Navigator.pop(context);
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
