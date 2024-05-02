import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/app_images.dart';
import 'package:food_delivery_app/views/auth/splash/walkthrough_screen.dart';
import 'package:get/get.dart';

import '../../../controllers/auth_controller/auth_controller.dart';
import '../../../utils/colors.dart';
import '../../../widgets/walkthrough_buttons.dart';
import 'welcome_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({Key? key}) : super(key: key);
  final PageController _controller = PageController();
  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            child: PageView(
              onPageChanged: (currentPageIndex) {
                print(currentPageIndex.runtimeType);
                authController.changeIndicatorColor(currentPageIndex);
              },
              controller: _controller,
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                WalkthroughScreens(
                  image: AppImages.walkthrough1,
                  text: 'Order food from your \nfavorite restaurants',
                  dotIndicatorPosition: 0,
                ),
                WalkthroughScreens(
                  image: AppImages.walkthrough2,
                  text: 'Book a near by ride in just\nfew clicks',
                  dotIndicatorPosition: 1,
                ),
                WalkthroughScreens(
                  image: AppImages.walkthrough3,
                  text: 'Get groceries delivered at\nyour doorsteps',
                  dotIndicatorPosition: 2,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 60.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(
                  () => Container(
                    height: 11,
                    width: 11,
                    decoration: BoxDecoration(
                      color: authController.isFirstScreen.value
                          ? AppColors.primaryColor
                          : Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                const SizedBox(width: 11),
                Obx(
                  () => Container(
                    height: 11,
                    width: 11,
                    decoration: BoxDecoration(
                      color: authController.is2ndScreen.value
                          ? AppColors.primaryColor
                          : Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                const SizedBox(width: 11),
                Obx(
                  () => Container(
                    height: 11,
                    width: 11,
                    decoration: BoxDecoration(
                      color: authController.is3rdScreen.value
                          ? AppColors.primaryColor
                          : Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 18.0),
            child: WalkthroughButtons(
              onPressedNext: () {
                print(_controller.page);
                if (_controller.page! < 2.0) {
                  // Check if there are more screens
                  _controller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease);
                } else {
                  Get.off(() => WelcomeScreen());
                }
              },
              onPressedSkip: () {
                Get.off(() => WelcomeScreen());
              },
            ),
          ),
        ],
      ),
    );
  }
}
