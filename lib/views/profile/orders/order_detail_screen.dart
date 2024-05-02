import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_app/utils/app_images.dart';

import '../../../utils/textStyles.dart';

class OrderDetailScreen extends StatelessWidget {
  const OrderDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Order Details',
          style: AppTextStyles.sohniFont.copyWith(
            fontSize: size.width * 0.05,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: size.height * 0.06),
          SvgPicture.asset(AppImages.orderDetailScreenImages),
          SizedBox(height: size.height * 0.01),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: SvgPicture.asset(AppImages.deliveryAddress),
          ),
          SizedBox(height: size.height * 0.01),
          SvgPicture.asset(AppImages.orderSummary),
          SizedBox(height: size.height * 0.01),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: SvgPicture.asset(AppImages.orderNote),
          ),
        ],
      ),
    );
  }
}
