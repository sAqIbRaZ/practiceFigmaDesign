import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/views/profile/orders/order_detail_screen.dart';
import 'package:food_delivery_app/views/profile/widget/reusable_order_history_widget.dart';
import 'package:get/get.dart';

import '../../../utils/app_images.dart';
import '../../../utils/textStyles.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'My Orders',
            style: AppTextStyles.sohniFont.copyWith(
              fontSize: size.width * 0.05,
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return ReusableOrderHistoryWidget(
              onTap: () {
                print('go to history screen');
                Get.to(() => OrderDetailScreen());
              },
            );
          },
        ));
  }
}
