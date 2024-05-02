import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/app_images.dart';

import '../../../utils/textStyles.dart';

class RestaurantMoreInfoScreen extends StatelessWidget {
  RestaurantMoreInfoScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  final listOfInfo = [
    {'image': AppImages.avatar, 'title': 'Ratings', 'trailing': '4.8 (225)'},
    {
      'image': AppImages.deliveryLocation,
      'title': 'Location',
      'trailing': 'Abc Street Johar Town, Lahore'
    },
    {
      'image': AppImages.openingHours,
      'title': 'Opening Hours',
      'trailing': '10:00 AM - 12:00 PM'
    },
    {
      'image': AppImages.deliveryBike,
      'title': 'Deliver within',
      'trailing': '30 mins'
    },
    {'image': AppImages.minOrder, 'title': 'Minimum Order', 'trailing': '\$10'},
    {
      'image': AppImages.payment,
      'title': 'Payment Options',
      'trailing': 'Stripe, others'
    },
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          title,
          style: AppTextStyles.sohniFont.copyWith(
            fontSize: size.width * 0.05,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(size.width * 0.035),
        child: Column(
          children: [
            Image.asset(AppImages.restaurantMapLocation),

            ///
            ///
            /// more details
            ///
            //

            SizedBox(height: size.height * 0.05),

            ListView.builder(
              shrinkWrap: true,
              itemCount: listOfInfo.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.asset(listOfInfo[index]['image'].toString()),
                  title: Text(
                    listOfInfo[index]['title'].toString(),
                    style: AppTextStyles.sohniFont.copyWith(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: size.width * 0.04),
                  ),
                  trailing: Text(
                    listOfInfo[index]['trailing'].toString(),
                    style: AppTextStyles.sohniFont.copyWith(
                        fontSize: size.width * 0.025,
                        fontWeight: FontWeight.w500),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
