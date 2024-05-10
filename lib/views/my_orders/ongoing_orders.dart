import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/controllers/order/order_controller.dart';
import 'package:food_delivery_app/utils/app_images.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/textStyles.dart';
import 'package:get/get.dart';

import '../tracking/order_tracking_screen.dart';
import '../widgets/my_orders_module/widgets/ongoing_order_time_widget.dart';
import '../widgets/reusable_elevated_button.dart';

class OnGoingOrdersScreen extends StatefulWidget {
  const OnGoingOrdersScreen({Key? key}) : super(key: key);

  @override
  State<OnGoingOrdersScreen> createState() => _OnGoingOrdersScreenState();
}

class _OnGoingOrdersScreenState extends State<OnGoingOrdersScreen> {
  final orderController = Get.put(OrderController());

  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(seconds: 3),
      () {
        orderController.preparingDoneFunction();
      },
    );
    Future.delayed(
      const Duration(seconds: 5),
      () {
        orderController.pickedUpDoneFunction();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Obx(() => Stack(
            children: [
              Positioned(
                top: 48,
                left: 20,
                child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(AppImages.backButton)),
              ),
              Positioned(
                  top: 56,
                  left: 125,
                  child: Text(
                    'Ongoing order',
                    style: AppTextStyles.sohniFont.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: size.width * 0.05,
                      color: AppColors.whiteColor,
                    ),
                  )),

              ///
              /// time to deliver 20 25 mins
              ///
              Positioned(
                top: size.height * 0.17,
                left: size.width * 0.32,
                child: Image.asset(AppImages.timeToDeliverOrder),
              ),

              ///
              /// half white container
              ///
              Positioned(
                bottom: 0,
                child: Container(
                  width: size.width,
                  height: size.height * 0.45,
                  color: AppColors.whiteColor,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 20,
                child: Container(
                  width: size.width * 0.89,
                  height: size.height * 0.55,
                  decoration: const BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///
                      /// order confirmed
                      //
                      OngoingOrderTimeWidget(
                        title: 'Confirmed',
                        subtitle: 'Finalizing your order',
                        trailing: Text(
                          'Feb 14, 2022\n04:20 pm',
                          textAlign: TextAlign.end,
                          style: AppTextStyles.sohniFont.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      OngoingOrderTimeWidget(
                        title: 'Preparing',
                        subtitle: 'Cooking your food',
                        leading: orderController.isPreparingDone.value
                            ? AppImages.preparingUpDone
                            : AppImages.cookingOngoingOrder,
                      ),
                      OngoingOrderTimeWidget(
                        title: 'Picked Up',
                        subtitle: 'Our rider has just picked up your food',
                        leading: orderController.isPickedUpDone.value
                            ? AppImages.pickedUpDone
                            : AppImages.pickedUpOngoingOrder,
                      ),
                      const OngoingOrderTimeWidget(
                        title: 'Delivered',
                        subtitle: 'Enjoy the food!',
                        leading: AppImages.deliveredOngoingOrder,
                      ),
                    ],
                  ),
                ),
              ),

              ///
              /// dotted lines
              ///
              Positioned(
                bottom: size.height * 0.43,
                left: size.width * 0.14,
                child: SizedBox(
                  height: size.height * 0.05,
                  child: const DottedLine(
                    direction: Axis.vertical,
                  ),
                ),
              ),
              Positioned(
                bottom: size.height * 0.33,
                left: size.width * 0.14,
                child: SizedBox(
                  height: size.height * 0.055,
                  child: const DottedLine(
                    direction: Axis.vertical,
                  ),
                ),
              ),
              Positioned(
                bottom: size.height * 0.23,
                left: size.width * 0.14,
                child: SizedBox(
                  height: size.height * 0.055,
                  child: const DottedLine(
                    direction: Axis.vertical,
                  ),
                ),
              ),

              ///
              /// Track on  map button
              //
              Positioned(
                bottom: 10,
                right: 10,
                left: 10,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      width: size.width,
                      height: size.height * 0.06,
                      child: ReusableElevatedButton(
                          buttonTextStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: size.width * 0.045,
                              color: AppColors.whiteColor),
                          borderSideColor: Colors.transparent,
                          textColor: Colors.white,
                          btnColor: orderController.isPickedUpDone.value
                              ? AppColors.primaryColor
                              : Colors.grey,
                          text: 'Track on map',
                          onPressed: orderController.isPickedUpDone.value
                              ? () {
                                  Get.to(() => OrderTrackingScreen());
                                }
                              : null)),
                ),
              )
            ],
          )),
    );
  }
}
