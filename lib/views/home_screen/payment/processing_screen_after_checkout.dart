import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/app_images.dart';
import 'package:food_delivery_app/utils/textStyles.dart';
import 'package:food_delivery_app/views/my_orders/ongoing_orders.dart';
import 'package:get/get.dart';

import '../../widgets/home_module/widgets/title_widget.dart';
import '../../widgets/reusable_appbar.dart';

class ProcessingScreen extends StatefulWidget {
  const ProcessingScreen({Key? key}) : super(key: key);

  @override
  State<ProcessingScreen> createState() => _ProcessingScreenState();
}

class _ProcessingScreenState extends State<ProcessingScreen> {
  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 3),
      () {
        print('init state running processing screen after checkout');
        Navigator.pop(context);
        Get.to(() => OnGoingOrdersScreen());
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: ReusableAppBar('Wait'),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: size.height * 0.08,
                left: size.width * 0.07,
                right: size.width * 0.07),
            child: Image.asset(AppImages.processingOrderImage),
          ),
          SizedBox(height: size.height * 0.08),
          const TitleTextWidget(title: 'Processing...'),
          SizedBox(height: size.height * 0.02),
          Text(
            'Please Wait.',
            style: AppTextStyles.sohniFont.copyWith(
                fontWeight: FontWeight.w500,
                color: Colors.grey,
                fontSize: size.width * 0.035),
          )
        ],
      ),
    );
  }
}
