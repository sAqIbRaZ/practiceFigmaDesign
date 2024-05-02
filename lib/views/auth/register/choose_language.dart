import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/app_images.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/textStyles.dart';
import 'package:food_delivery_app/views/auth/register/enable_location_screen.dart';
import 'package:food_delivery_app/widgets/reusable_elevated_button.dart';
import 'package:get/get.dart';

import '../../../controllers/auth_controller/auth_controller.dart';

class ChooseLanguageScreen extends StatefulWidget {
  const ChooseLanguageScreen({Key? key}) : super(key: key);

  @override
  State<ChooseLanguageScreen> createState() => _ChooseLanguageScreenState();
}

class _ChooseLanguageScreenState extends State<ChooseLanguageScreen> {
  @override
  void initState() {
    super.initState();
  }

  final listOfLanguages = [
    {'language': 'English', 'imagePath': AppImages.usFlag},
    {'language': 'Portuguese', 'imagePath': AppImages.portugeseFlag},
    {'language': 'Arabic', 'imagePath': AppImages.arabicFlag},
    {'language': 'French', 'imagePath': AppImages.frenchFlag},
    {'language': 'Amharic', 'imagePath': AppImages.amharicFlag},
    {'language': 'Swahli', 'imagePath': AppImages.swahliFlag},
  ];

  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.height * 0.026),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 0.13),
            Padding(
              padding: EdgeInsets.only(left: size.height * 0.02),
              child: Text(
                'Select Language',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'heebo',
                  fontSize: size.height * 0.028,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.02),

            // languages
            ...listOfLanguages
                .map((e) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Obx(
                        () => Container(
                          color: authController.currentLanguage.value ==
                                  e['language']
                              ? AppColors.primaryColorLow
                              : Colors.transparent,
                          child: ListTile(
                            splashColor: AppColors.primaryColorLow,
                            onTap: () {
                              print(e);
                              authController.selectLanguageFunction(
                                  e['language'].toString());
                            },
                            title: Text(
                              e['language'].toString(),
                              style: AppTextStyles.defaultTextStyle.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: size.width * 0.036,
                              ),
                            ),
                            leading: SizedBox(
                              width: size.width * 0.1,
                              child: CircleAvatar(
                                backgroundImage: AssetImage(
                                  e['imagePath'].toString(),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ))
                .toList(),

            ///
            /// btn choose and continue
            //
            SizedBox(height: size.height * 0.11),

            SizedBox(
              width: double.infinity,
              child: ReusableElevatedButton(
                textColor: AppColors.whiteColor,
                btnColor: AppColors.primaryColor,
                text: 'Choose & continue',
                onPressed: () {
                  Get.off(const EnableLocationScreen());
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
