import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/app_images.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/textStyles.dart';
import 'package:get/get.dart';

import '../../../controllers/home_module/home_controller.dart';
import '../../widgets/home_module/widgets/title_widget.dart';
import '../../widgets/reusable_elevated_button.dart';

class FoodDetailScreen extends StatelessWidget {
  FoodDetailScreen({Key? key, required this.title}) : super(key: key);
  final String title;
  final homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///
          /// upper image with close button
          ///
          Stack(
            children: [
              SizedBox(
                  height: size.height * 0.25,
                  width: size.width,
                  child: Image.asset(
                    AppImages.foodDetailImage,
                    fit: BoxFit.fill,
                  )),
              Positioned(
                top: size.height * 0.013,
                right: size.width * 0.038,
                child: Container(
                  height: size.height * 0.11,
                  width: size.width * 0.11,
                  decoration: const BoxDecoration(
                      color: AppColors.whiteColor, shape: BoxShape.circle),
                ),
              ),
              Positioned(
                  top: size.height * 0.035,
                  right: size.width * 0.026,
                  child: IconButton(
                    onPressed: () {
                      print('POP the page');
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close),
                  )),
            ],
          ),

          ///
          /// title and desc
          ///
          //

          SizedBox(
            height: size.height * 0.67,
            width: size.width,
            child: Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.035, top: size.width * 0.023),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: AppTextStyles.sohniFont.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: size.width * 0.05)),
                    SizedBox(height: size.height * 0.01),
                    Text(
                      'In size of your choice with jalapenos, served with choice of sauces for two persons..',
                      style: AppTextStyles.sohniFont.copyWith(
                        color: Colors.grey.shade600,
                        fontSize: size.width * 0.034,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(height: size.height * 0.01),
                    Text(
                      '2,19 \$',
                      style: AppTextStyles.sohniFont.copyWith(
                        color: AppColors.primaryColor,
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Divider(),
                    const TitleTextWidget(title: 'Choose serving'),
                    Text(
                      'You must select at least one item',
                      style: AppTextStyles.sohniFont.copyWith(
                        color: Colors.grey.shade600,
                        fontSize: size.width * 0.034,
                        fontWeight: FontWeight.w300,
                      ),
                    ),

                    ///
                    /// radio list tile to select 6 pieces or 9 pieces or 12 pieces
                    ///

                    Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: Obx(() => Column(
                            children: [
                              Row(
                                children: [
                                  Flexible(
                                    child: RadioListTile(
                                        title: Text(
                                          '6 pieces',
                                          style:
                                              AppTextStyles.sohniFont.copyWith(
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        value: 0,
                                        selectedTileColor:
                                            AppColors.primaryColor,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 0),
                                        fillColor:
                                            const MaterialStatePropertyAll(
                                                AppColors.primaryColor),
                                        groupValue: homeController
                                            .selectedServing.value,
                                        onChanged: (value) {
                                          print(value);
                                          homeController
                                              .selectedServingFunction(
                                                  int.parse(value.toString()));
                                        }),
                                  ),
                                  Text(
                                    '+ 0,00 €',
                                    style: AppTextStyles.sohniFont.copyWith(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Flexible(
                                    child: RadioListTile(
                                        title: Text(
                                          '9 pieces',
                                          style:
                                              AppTextStyles.sohniFont.copyWith(
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        value: 1,
                                        selectedTileColor:
                                            AppColors.primaryColor,
                                        contentPadding: EdgeInsets.zero,
                                        groupValue: homeController
                                            .selectedServing.value,
                                        fillColor:
                                            const MaterialStatePropertyAll(
                                                AppColors.primaryColor),
                                        onChanged: (value) {
                                          print(value);
                                          homeController
                                              .selectedServingFunction(
                                                  int.parse(value.toString()));
                                        }),
                                  ),
                                  Text(
                                    '+ 1,40 €',
                                    style: AppTextStyles.sohniFont.copyWith(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Flexible(
                                    child: RadioListTile(
                                        title: Text(
                                          '12 pieces',
                                          style:
                                              AppTextStyles.sohniFont.copyWith(
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        value: 2,
                                        selectedTileColor:
                                            AppColors.primaryColor,
                                        activeColor: AppColors.primaryColor,
                                        fillColor:
                                            const MaterialStatePropertyAll(
                                                AppColors.primaryColor),
                                        contentPadding: EdgeInsets.zero,
                                        groupValue: homeController
                                            .selectedServing.value,
                                        onChanged: (value) {
                                          print(value);
                                          homeController
                                              .selectedServingFunction(
                                                  int.parse(value.toString()));
                                        }),
                                  ),
                                  Text(
                                    '+ 1,40 €',
                                    style: AppTextStyles.sohniFont.copyWith(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )),
                    ),

                    ///
                    /// choose ad ons
                    ///
                    //
                    const TitleTextWidget(title: 'Choose add ons'),
                    Text(
                      'You can select up to 3 items',
                      style: AppTextStyles.sohniFont.copyWith(
                        color: Colors.grey.shade600,
                        fontSize: size.width * 0.034,
                        fontWeight: FontWeight.w300,
                      ),
                    ),

                    Obx(() => Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 12.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: size.width * 0.4,
                                    child: Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: CheckboxListTile(
                                        contentPadding: EdgeInsets.zero,
                                        title: Text(
                                          'Chili sauce ',
                                          style: AppTextStyles.sohniFont
                                              .copyWith(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: size.width * 0.04),
                                        ),
                                        value: homeController
                                            .isChilliSelected.value,
                                        activeColor: AppColors.primaryColor,
                                        onChanged: (value) {
                                          print(value);
                                          homeController
                                              .isChiliSeclectedFunction(value!);
                                        },
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '+ 0,00 €',
                                    style: AppTextStyles.sohniFont.copyWith(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 12.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: size.width * 0.42,
                                    child: Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: CheckboxListTile(
                                        contentPadding: EdgeInsets.zero,
                                        title: Text(
                                          'Garlic mayo',
                                          style: AppTextStyles.sohniFont
                                              .copyWith(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: size.width * 0.04),
                                        ),
                                        value:
                                            homeController.isMayoSelected.value,
                                        activeColor: AppColors.primaryColor,
                                        onChanged: (value) {
                                          print(value);
                                          homeController
                                              .isMayoSeclectedFunction(value!);
                                        },
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '+ 0,00 €',
                                    style: AppTextStyles.sohniFont.copyWith(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 12.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: size.width * 0.55,
                                    child: Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: CheckboxListTile(
                                        contentPadding: EdgeInsets.zero,
                                        title: Text(
                                          'Mushroom sauce',
                                          style: AppTextStyles.sohniFont
                                              .copyWith(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: size.width * 0.04),
                                        ),
                                        value: homeController
                                            .ismushroomsSelected.value,
                                        activeColor: AppColors.primaryColor,
                                        onChanged: (value) {
                                          print(value);
                                          homeController
                                              .isMushroomsSeclectedFunction(
                                                  value!);
                                        },
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '+ 0,00 €',
                                    style: AppTextStyles.sohniFont.copyWith(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              ),
            ),
          ),

          ///
          /// add to cart button
          ///
          //

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: size.height * 0.055,
                width: size.width * 0.45,
                decoration: BoxDecoration(
                  color: const Color(0xffFFE1DA),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Obx(() => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                              onTap: () {
                                homeController.itemQuantitydecrement();
                              },
                              child: Image.asset(AppImages.minus)),
                          Text(homeController.itemQuantity.value.toString()),
                          InkWell(
                              onTap: () {
                                homeController.itemQuantityIncrement();
                              },
                              child: Image.asset(AppImages.plus)),
                        ],
                      ),
                    )),
              ),
              ReusableElevatedButton(
                  textColor: AppColors.whiteColor,
                  btnColor: AppColors.primaryColor,
                  text: 'Add to Cart',
                  onPressed: () {
                    Navigator.of(context).pop();
                    print(homeController.isItemsAddedToCart.value.toString());

                    homeController.ItemAddedToCartFuction();
                    print(homeController.isItemsAddedToCart.value.toString());

                    final snackBar = SnackBar(
                      behavior: SnackBarBehavior.floating,
                      margin: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 5),
                      backgroundColor: AppColors.primaryColor,
                      content: Row(
                        children: [
                          Image.asset(AppImages.cartBasketIcon),
                          const SizedBox(width: 15),
                          Text(
                            '(3 items) View your Cart     \$ 130.00  ',
                            textAlign: TextAlign.center,
                            style: AppTextStyles.sohniFont.copyWith(
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ],
                      ),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }),
            ],
          )
        ],
      ),
    );
  }
}
