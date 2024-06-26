import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/widgets/reusable_elevated_button.dart';

import '../../../utils/app_images.dart';
import '../../../utils/textStyles.dart';

class EmptyBasketScreen extends StatelessWidget {
  const EmptyBasketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'My Basket',
          style: AppTextStyles.sohniFont.copyWith(
            fontSize: size.width * 0.05,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Image.asset(AppImages.emptyBasket)),
            SizedBox(height: size.height * 0.05),
            SizedBox(
              width: size.width,
              child: ReusableElevatedButton(
                  textColor: AppColors.whiteColor,
                  btnColor: AppColors.primaryColor,
                  text: 'Continue Shopping',
                  onPressed: () {}),
            )
          ],
        ),
      ),
    );
  }
}
