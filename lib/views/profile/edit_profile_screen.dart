import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_app/controllers/profile_module/profile_controller.dart';
import 'package:food_delivery_app/utils/app_images.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/textStyles.dart';
import 'package:food_delivery_app/views/profile/profile_screen.dart';
import 'package:food_delivery_app/widgets/reusable_textfield.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatefulWidget {
  EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return PopScope(
      onPopInvoked: (didPop) {
        profileController.stopEditProfileFunction();
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Edit Profile',
            style: AppTextStyles.sohniFont.copyWith(
              fontSize: size.width * 0.05,
            ),
          ),
          actions: [
            if (!profileController.editProfile.value)
              IconButton(
                onPressed: () {
                  profileController.editProfileFunction();
                  setState(() {});
                },
                icon: Stack(
                  children: [
                    Positioned(
                      left: size.width * 0.011,
                      bottom: size.width * 0.013,
                      child: SvgPicture.asset(AppImages.pencilSVGIcon),
                    ),
                    SvgPicture.asset(AppImages.editProfileSVGIcon),
                  ],
                ),
              )
            else
              TextButton(
                onPressed: () {
                  profileController.stopEditProfileFunction();
                  setState(() {});
                },
                child: Text(
                  'Save',
                  style: AppTextStyles.sohniFont.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
          ],
        ), // appbar is not changing the edit button to save button
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Username'),
                ReusableTextField(
                  readOnly: !profileController.editProfile.value,
                  textFieldColor: Colors.transparent,
                  borderColor: AppColors.whiteColor,
                  hintText: 'Zeeshan Nawaz',
                  hintTextStyle:
                      AppTextStyles.sohniFont.copyWith(color: Colors.black),
                ),
                SizedBox(height: size.height * 0.016),
                const Divider(),
                SizedBox(height: size.height * 0.02),
                const Text('Email address'),
                ReusableTextField(
                  readOnly: !profileController.editProfile.value,
                  textFieldColor: Colors.transparent,
                  borderColor: AppColors.whiteColor,
                  hintText: 'Zeeshan****@gmail.com',
                  hintTextStyle: AppTextStyles.sohniFont.copyWith(
                      color: Colors.black, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: size.height * 0.016),
                const Divider(),
                SizedBox(height: size.height * 0.02),
                const Text('Phone'),
                ReusableTextField(
                  readOnly: !profileController.editProfile.value,
                  textFieldColor: Colors.transparent,
                  borderColor: AppColors.whiteColor,
                  hintText: '+92320***0420',
                  hintTextStyle: AppTextStyles.sohniFont.copyWith(
                      color: Colors.black, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: size.height * 0.016),
                const Divider(),
                SizedBox(height: size.height * 0.02),
                const Text('Password'),
                ReusableTextField(
                  readOnly: !profileController.editProfile.value,
                  textFieldColor: Colors.transparent,
                  borderColor: AppColors.whiteColor,
                  hintText: '+********',
                  hintTextStyle: AppTextStyles.sohniFont.copyWith(
                      color: Colors.black, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: size.height * 0.016),
                const Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
