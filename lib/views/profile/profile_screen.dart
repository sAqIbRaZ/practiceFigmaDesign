import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/app_images.dart';
import 'package:food_delivery_app/utils/textStyles.dart';
import 'package:food_delivery_app/views/profile/edit_profile_screen.dart';
import 'package:food_delivery_app/views/profile/saved_addresses_screen.dart';
import 'package:food_delivery_app/views/profile/orders/order_history_screen.dart';
import 'package:food_delivery_app/views/profile/widget/reusable_list_tile.dart';
import 'package:food_delivery_app/widgets/bottom_nav_bar_widget.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Profile screen'),
      // ),
      body: Padding(
        padding: EdgeInsets.only(top: size.height * 0.1),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: size.width * 0.06),
                child: Text(
                  'Ahmad Salman',
                  style: AppTextStyles.sohniFont.copyWith(
                    fontSize: size.width * 0.045,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: size.width * 0.06),
                child: Text(
                  'ahmadsalman123@gmail.com',
                  style: AppTextStyles.sohniFont.copyWith(
                    fontSize: size.width * 0.03,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
              ),

              ///
              /// list tile widget
              //
              SizedBox(height: size.height * 0.1),
              ReusableListTile(
                title: 'Edit Profile',
                imagePath: AppImages.editSVGIcon,
                onTap: () {
                  Get.to(() => EditProfileScreen());
                },
              ),

              ReusableListTile(
                title: 'Saved address',
                imagePath: AppImages.walletSVGIcon,
                onTap: () {
                  Get.to(() => SavedAddressesScreen());
                },
              ),

              ReusableListTile(
                title: 'Order History',
                imagePath: AppImages.orderSVGIcon,
                onTap: () {
                  Get.to(() => OrderHistoryScreen());
                },
              ),
              ReusableListTile(
                title: 'Favourite List',
                imagePath: AppImages.favouriteSVGIcon,
                onTap: () => null,
              ),
              ReusableListTile(
                title: 'Wallet',
                imagePath: AppImages.walletSVGIcon,
                onTap: () => null,
              ),
              ReusableListTile(
                title: 'Promo & Deals',
                imagePath: AppImages.promoSVGIcon,
                onTap: () => null,
              ),
              ReusableListTile(
                title: 'Payment Method',
                imagePath: AppImages.paymentSVGIcon,
                onTap: () => null,
              ),
              ReusableListTile(
                title: 'Help & Support',
                imagePath: AppImages.helpSVGIcon,
                onTap: () => null,
              ),
              ReusableListTile(
                title: 'Privacy Policy',
                imagePath: AppImages.privacy_pollicySVGIcon,
                onTap: () => null,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBarWidget(),
    );
  }
}
