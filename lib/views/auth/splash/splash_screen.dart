import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery_app/utils/app_images.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:get/get.dart';

import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Get.off(() => OnBoardingScreen());
        // replaces the current screen with FirstWalkthroughScreen
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Make background transparent
        elevation: 0.0,
      ),
      backgroundColor: AppColors.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Image.asset(
            AppImages.appLogo,
            color: AppColors.whiteColor,
          )),
          const SizedBox(
            height: 28,
          ),
          Text(
            'MY  ACE',
            style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: size.width * 0.09,
                fontFamily: 'heebo',
                letterSpacing: 4.0,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
