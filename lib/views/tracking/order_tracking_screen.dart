import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/app_images.dart';
import 'package:food_delivery_app/utils/textStyles.dart';
import 'package:food_delivery_app/views/tracking/rate_driver_screen.dart';
import 'package:get/get.dart';

import '../widgets/reusable_appbar.dart';

class OrderTrackingScreen extends StatefulWidget {
  const OrderTrackingScreen({Key? key}) : super(key: key);

  @override
  State<OrderTrackingScreen> createState() => _OrderTrackingScreenState();
}

class _OrderTrackingScreenState extends State<OrderTrackingScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Get.to(() => RateDriverScreen());
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: const ReusableAppBar('Order tracking'),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Image.asset(AppImages.orderTrackingMapImage),

            ///
            /// order tracking location and time

            Positioned(
              top: size.height * 0.52,
              child: Container(
                color: Colors.white,
                width: size.width,
                height: size.height * 0.4,
                child: Column(
                  children: [
                    ListTile(
                      leading: Image.asset(AppImages.orderTrackingLocation),
                      title: Text(
                        'K block Phase 1, DHA Lahore',
                        style: AppTextStyles.sohniFont.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: size.width * 0.04,
                        ),
                      ),
                      subtitle: Text(
                        'Delivery address',
                        style: AppTextStyles.sohniFont.copyWith(
                          fontWeight: FontWeight.w300,
                          fontSize: size.width * 0.035,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Image.asset(AppImages.orderTrackingtime),
                      title: Text(
                        '20 mins',
                        style: AppTextStyles.sohniFont.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: size.width * 0.04,
                        ),
                      ),
                      subtitle: Text(
                        'Delivery time',
                        style: AppTextStyles.sohniFont.copyWith(
                          fontWeight: FontWeight.w300,
                          fontSize: size.width * 0.035,
                        ),
                      ),
                    ),

                    ///
                    /// divider
                    //
                    const Divider(),

                    ///
                    /// driver informatons
                    //
                    ListTile(
                      leading: const Icon(Icons.person_2_rounded),
                      title: Text(
                        'M. Uzair',
                        style: AppTextStyles.sohniFont.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: size.width * 0.04,
                        ),
                      ),
                      subtitle: Text(
                        '😊 Very Good',
                        style: AppTextStyles.sohniFont.copyWith(
                          fontWeight: FontWeight.w300,
                          fontSize: size.width * 0.035,
                        ),
                      ),
                      trailing: SizedBox(
                          width: size.width * 0.2,
                          height: size.height * 0.04,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(AppImages.message_driver),
                              SizedBox(width: size.width * 0.027),
                              Image.asset(AppImages.callDriver),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
