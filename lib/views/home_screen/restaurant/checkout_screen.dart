import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/app_images.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/textStyles.dart';
import 'package:get/get.dart';
import '../../../controllers/home_module/home_controller.dart';
import '../../../utils/constants.dart';
import '../../widgets/home_module/widgets/listtile_checkout_Screen_widget.dart';
import '../../widgets/home_module/widgets/reusable_button_checkout_screen.dart';
import '../../widgets/home_module/widgets/title_widget.dart';
import '../../widgets/reusable_appbar.dart';
import '../../widgets/reusable_elevated_button.dart';
import '../../widgets/reusable_textfield.dart';
import '../payment/add_card_screen.dart';
import '../payment/processing_screen_after_checkout.dart';

class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({Key? key}) : super(key: key);
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: const ReusableAppBar('Checkout'),
      body: SingleChildScrollView(
        child: Obx(() => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height * 0.01),

                Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, left: 10.0, right: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              width: size.width * 0.4,
                              decoration: const BoxDecoration(
                                  color: AppColors.primaryColor,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(4),
                                      bottomLeft: Radius.circular(4))),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.all(size.width * 0.023),
                                  child: Text(
                                    'Delivery',
                                    style: AppTextStyles.sohniFont.copyWith(
                                      color: AppColors.whiteColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              width: size.width * 0.4,
                              decoration: BoxDecoration(
                                  color: AppColors.whiteColor,
                                  border:
                                      Border.all(color: Colors.grey.shade400),
                                  borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(4),
                                      bottomRight: Radius.circular(4))),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.all(size.width * 0.021),
                                  child: Text(
                                    'Pickup',
                                    style: AppTextStyles.sohniFont.copyWith(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      ///
                      /// delivery address
                      //

                      ListTile(
                        leading: Image.asset(AppImages.checkoutLocationIcon),
                        title: const TitleTextWidget(title: 'Delivery address'),
                        subtitle: Text(
                          'B Block, Johar Town, Lahore',
                          style: AppTextStyles.sohniFont.copyWith(
                            fontSize: size.width * 0.03,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        trailing: ReusableButtonCheckout(
                          title: 'Change',
                          onTap: () {},
                        ),
                      ),

                      ///
                      /// payment details
                      //

                      Text(
                        'Payment method',
                        style: AppTextStyles.sohniFont.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: size.width * 0.045,
                        ),
                      ),
                      homeController.isPaymentCardAdded.value
                          ? ListTile(
                              leading: Image.asset(AppImages.masterCardIcon),
                              title: Text(
                                'XXXX-XXXX-XXXX-1234',
                                style: AppTextStyles.sohniFont.copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontSize: size.width * 0.03,
                                ),
                              ),
                              trailing: ReusableButtonCheckout(
                                title: 'Change',
                                onTap: () {
                                  Get.to(() => AddCardScreen());
                                },
                              ),
                            )
                          : ListTile(
                              leading: Image.asset(AppImages.paymentIcon),
                              title: Text(
                                'Add a debit/ credit card',
                                style: AppTextStyles.sohniFont.copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontSize: size.width * 0.035,
                                ),
                              ),
                              trailing: ReusableButtonCheckout(
                                title: 'Add',
                                onTap: () {
                                  Get.to(() => AddCardScreen());
                                },
                              ),
                            ),

                      ///
                      ///
                      ///Order summary
                      //
                      ListTile(
                        onTap: () {},
                        leading: Image.asset(AppImages.orderSummaryIcon),
                        title: const TitleTextWidget(title: 'Order summary'),
                        trailing: const Icon(Icons.keyboard_arrow_up_rounded),
                      ),

                      const Divider(),

                      ...AppConstants.itemsInBasket.map((item) {
                        return ListTile(
                          leading: const TitleTextWidget(
                            title: 'x1',
                          ),
                          title:
                              TitleTextWidget(title: item['title'].toString()),
                          subtitle: Text(
                            item['desc'].toString(),
                            style: AppTextStyles.sohniFont.copyWith(
                              fontWeight: FontWeight.w300,
                              fontSize: size.width * 0.035,
                            ),
                          ),
                          trailing: Text(
                            item['price'].toString(),
                            style: AppTextStyles.sohniFont.copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppColors.primaryColor,
                              fontSize: size.width * 0.035,
                            ),
                          ),
                        );
                      }),

                      ///
                      /// i have a voucher sections
                      ///

                      Row(
                        children: [
                          Image.asset(AppImages.voucherIcon),
                          SizedBox(width: size.width * 0.03),
                          Text(
                            'I have a voucher',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: size.width * 0.04,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: size.height * 0.01),

                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                              child: SizedBox(
                            height: size.height * 0.055,
                            child: const ReusableTextField(
                              textFieldColor: AppColors.whiteColor,
                              hintText: 'Enter vocuher code...',
                            ),
                          )),
                          SizedBox(width: size.width * 0.04),
                          ReusableElevatedButton(
                              textColor: AppColors.whiteColor,
                              btnColor: AppColors.primaryColor,
                              text: 'Apply',
                              onPressed: () {})
                        ],
                      ),
                    ],
                  ),
                ),

                ///
                ///
                /// dotted divider
                ///
                //
                SizedBox(height: size.height * 0.02),
                const DottedLine(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.center,
                  lineLength: double.infinity,
                  lineThickness: 1.0,
                  dashLength: 4.0,
                  dashColor: Colors.grey,
                  dashRadius: 0.0,
                  dashGapLength: 4.0,
                  dashGapColor: Colors.transparent,
                  dashGapRadius: 0.0,
                ),

                Padding(
                  padding:
                      const EdgeInsets.only(top: 18.0, left: 8.0, right: 8),
                  child: Column(
                    children: [
                      ///
                      ///
                      ///Sub total and tax etc
                      //
                      ListTileCheckoutScreen(
                          title: 'Subtotal', trailing_price: '6.75 \$'),
                      SizedBox(height: size.height * 0.01),
                      ListTileCheckoutScreen(
                          title: 'Tax', trailing_price: '2.75 \$'),
                      SizedBox(height: size.height * 0.01),
                      ListTileCheckoutScreen(
                          title: 'Delivery charges', trailing_price: '1.50 \$'),
                      SizedBox(height: size.height * 0.01),
                      ListTileCheckoutScreen(
                          title: 'Service fee', trailing_price: '2.00 \$'),
                      SizedBox(height: size.height * 0.01),
                      ListTileCheckoutScreen(
                        title: 'Total',
                        trailing_price: '20.60 \$',
                        textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: size.width * 0.035,
                        ),
                      ),

                      ///
                      /// add payment method button
                      //
                      SizedBox(height: size.height * 0.02),

                      homeController.isPaymentCardAdded.value
                          ? SizedBox(
                              width: size.width,
                              child: ReusableElevatedButton(
                                  textColor: AppColors.whiteColor,
                                  btnColor: AppColors.primaryColor,
                                  text: 'Proceed to payment',
                                  onPressed: () {
                                    Get.to(() => ProcessingScreen());
                                  }),
                            )
                          : InkWell(
                              onTap: () {},
                              child: Container(
                                width: size.width,
                                height: 68,
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(4)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Add payment method',
                                      style: AppTextStyles.sohniFont.copyWith(
                                        color: AppColors.whiteColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      'Add a payment method to continue with order',
                                      style: AppTextStyles.sohniFont.copyWith(
                                          color: Colors.white,
                                          fontSize: size.width * 0.03,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                      SizedBox(height: size.height * 0.01),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
