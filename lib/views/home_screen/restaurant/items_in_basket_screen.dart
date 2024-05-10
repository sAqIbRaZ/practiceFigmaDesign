import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/app_images.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/constants.dart';
import 'package:food_delivery_app/utils/textStyles.dart';
import 'package:get/get.dart';

import '../../../controllers/home_module/home_controller.dart';
import '../../widgets/home_module/widgets/title_widget.dart';
import '../../widgets/reusable_appbar.dart';
import '../../widgets/reusable_elevated_button.dart';
import 'checkout_screen.dart';

class ItemsInBasketsScreen extends StatelessWidget {
  ItemsInBasketsScreen({Key? key}) : super(key: key);
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const ReusableAppBar('Mcdonald\'s - DHA'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'My Basket',
                    style: AppTextStyles.sohniFont.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: size.width * 0.05,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    '03 products',
                    style: AppTextStyles.sohniFont.copyWith(
                      fontWeight: FontWeight.w300,
                      fontSize: size.width * 0.035,
                    ),
                  )
                ],
              ),

              ///
              ///
              /// items in basket
              //

              SizedBox(height: size.height * 0.01),

              ...AppConstants.itemsInBasket.map((item) {
                return SizedBox(
                  width: size.width,
                  height: size.height * 0.13,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Stack(
                      children: [
                        TitleTextWidget(title: item['title'].toString()),
                        Positioned(
                          right: 85,
                          bottom: 0,
                          child: SizedBox(
                            height: size.height * 0.04,
                            width: size.width * 0.4,
                            child: Obx(() => Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          homeController
                                              .itemQuantitydecrement();
                                        },
                                        child: Image.asset(AppImages.minus)),
                                    Text(homeController.itemQuantity.value
                                        .toString()),
                                    InkWell(
                                        onTap: () {
                                          homeController
                                              .itemQuantityIncrement();
                                        },
                                        child: Image.asset(AppImages.plus)),
                                  ],
                                )),
                          ),
                        ),
                        Positioned(
                            top: 25,
                            child: Text(
                              item['desc'].toString(),
                              style: AppTextStyles.sohniFont.copyWith(
                                fontWeight: FontWeight.w300,
                              ),
                            )),
                        Positioned(
                            top: 50,
                            child: Text(
                              item['price'].toString(),
                              style: AppTextStyles.sohniFont.copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppColors.primaryColor,
                              ),
                            )),
                        Positioned(
                          right: 0,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Image.asset(item['image'].toString())),
                        ),
                      ],
                    ),
                  ),
                );
              }),

              ///
              /// divider line
              //

              const Divider(),
              SizedBox(height: size.height * 0.01),

              Row(
                children: [
                  Image.asset(
                    AppImages.deliveryInstructionsBasketScreen,
                    width: size.width * 0.055,
                  ),
                  SizedBox(width: size.width * 0.01),
                  const TitleTextWidget(title: 'Delivery instructions'),
                ],
              ),

              ///
              /// textarea
              //
              SizedBox(height: size.height * 0.01),

              TextFormField(
                maxLines: 4,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  hintText: 'What else do you want us to know?',
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: size.width * 0.04,
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      )),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      )),
                ),
              ),

              ///
              /// checkout button
              //
              SizedBox(height: size.height * 0.1),

              SizedBox(
                width: size.width,
                child: ReusableElevatedButton(
                    textColor: AppColors.whiteColor,
                    btnColor: AppColors.primaryColor,
                    text: 'Checkout',
                    onPressed: () {
                      Get.to(() => CheckoutScreen());
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
