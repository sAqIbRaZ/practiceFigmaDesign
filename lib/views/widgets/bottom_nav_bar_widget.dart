import 'package:flutter/material.dart';
import 'package:food_delivery_app/controllers/auth_controller/auth_controller.dart';
import 'package:food_delivery_app/views/home_screen/first_home_screen.dart';
import 'package:food_delivery_app/views/my_orders/my_orders_screen.dart';
import 'package:food_delivery_app/views/profile/profile_screen.dart';
import 'package:food_delivery_app/views/tracking/tracking_screen.dart';
import 'package:get/get.dart';

import '../../utils/app_images.dart';
import '../../utils/colors.dart';

class BottomNavBarWidget extends StatelessWidget {
  BottomNavBarWidget({Key? key}) : super(key: key);
  final isAuthControllerInitialized = Get.isRegistered<AuthController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // print(
    //     'current nnanna bar index 😢😢😢 ${authController.currentNavBarIndex.value}');
    return Obx(() => BottomNavigationBar(
          selectedItemColor: AppColors.primaryColor,
          currentIndex: Get.find<AuthController>().currentNavBarIndex.value,
          unselectedItemColor: Colors.black,
          onTap: (index) {
            if (Get.find<AuthController>().currentNavBarIndex.value == index) {
              return;
            }
            Get.find<AuthController>().changeCurrentNavBarIndexFunction(index);
            if (Get.find<AuthController>().currentNavBarIndex.value == 0) {
              Get.off(() => FirstHomeScreen());
            } else if (Get.find<AuthController>().currentNavBarIndex.value ==
                1) {
              Get.off(() => TrackingScreen());
            } else if (Get.find<AuthController>().currentNavBarIndex.value ==
                2) {
              Get.off(() => MyOrdersScreen());
            } else if (Get.find<AuthController>().currentNavBarIndex.value ==
                3) {
              Get.off(() => ProfileScreen());
            }
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Container(
                width: 50,
                decoration: BoxDecoration(
                    color:
                        Get.find<AuthController>().currentNavBarIndex.value == 0
                            ? AppColors.primaryColor
                            : Colors.transparent,
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3.0),
                  child: Image.asset(
                    AppImages.homeIcon,
                    color:
                        Get.find<AuthController>().currentNavBarIndex.value == 0
                            ? AppColors.whiteColor
                            : Colors.black,
                    height: size.height * 0.025,
                  ),
                ),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Container(
                width: 50,
                decoration: BoxDecoration(
                    color:
                        Get.find<AuthController>().currentNavBarIndex.value == 1
                            ? AppColors.primaryColor
                            : Colors.transparent,
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3.0),
                  child: Image.asset(
                    AppImages.trackOrderIcon,
                    color:
                        Get.find<AuthController>().currentNavBarIndex.value == 1
                            ? AppColors.whiteColor
                            : Colors.black,
                    height: size.height * 0.03,
                  ),
                ),
              ),
              label: 'Tracking',
            ),
            BottomNavigationBarItem(
              icon: Container(
                width: 50,
                decoration: BoxDecoration(
                    color:
                        Get.find<AuthController>().currentNavBarIndex.value == 2
                            ? AppColors.primaryColor
                            : Colors.transparent,
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3.0),
                  child: Image.asset(
                    AppImages.myOrdersIcon,
                    color:
                        Get.find<AuthController>().currentNavBarIndex.value == 2
                            ? AppColors.whiteColor
                            : Colors.black,
                    height: size.height * 0.025,
                  ),
                ),
              ),
              label: 'My orders',
            ),
            BottomNavigationBarItem(
              icon: Container(
                width: 50,
                decoration: BoxDecoration(
                    color:
                        Get.find<AuthController>().currentNavBarIndex.value == 3
                            ? AppColors.primaryColor
                            : Colors.transparent,
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3.0),
                  child: Image.asset(
                    AppImages.profileIcon,
                    color:
                        Get.find<AuthController>().currentNavBarIndex.value == 3
                            ? AppColors.whiteColor
                            : Colors.black,
                    height: size.height * 0.025,
                  ),
                ),
              ),
              label: 'Profile',
            ),
          ],
        ));
  }
}
