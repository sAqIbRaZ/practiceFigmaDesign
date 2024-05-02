import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery_app/views/home_screen/widgets/title_widget.dart';
import 'package:get/get.dart';

import '../../../utils/app_images.dart';
import '../../../utils/colors.dart';
import '../../../utils/textStyles.dart';

class NearbyRestaurantScreen extends StatelessWidget {
  const NearbyRestaurantScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Nearby restaurant',
            style: AppTextStyles.sohniFont.copyWith(
              fontSize: size.width * 0.05,
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Card(
                    color: AppColors.whiteColor,
                    elevation: 7,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(6),
                                child: Image.asset(
                                  AppImages.nearbyRestaurant,
                                  fit: BoxFit.fitWidth,
                                  height: size.height * 0.2,
                                ),
                              ),
                              Positioned(
                                top: size.height * 0.01,
                                left: size.height * 0.005,
                                child: Image.asset(AppImages.hilal),
                              ),
                              Positioned(
                                  top: size.height * 0.01,
                                  right: size.width * 0.06,
                                  child: Image.asset(AppImages.favourite)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: size.width * 0.3),
                          child: const TitleTextWidget(
                            title: 'Mcdonald\'s - DHA',
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: size.width * 0.38),
                          child: const Text(
                            'Fast Food. Fresh. Steaks',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 8,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: size.width * 0.125),
                          child: Row(
                            children: [
                              SizedBox(
                                  width: 12,
                                  child: Image.asset(AppImages.avatar)),
                              const Text(' 4.8',
                                  style: TextStyle(
                                      fontSize: 9,
                                      color: AppColors.primaryColor)),
                              const SizedBox(width: 10),
                              SizedBox(
                                  width: 12,
                                  child: Image.asset(AppImages.bike)),
                              Text(' 3.35 \$',
                                  style: TextStyle(
                                    fontSize: 9,
                                    color: Colors.grey.shade600,
                                  )),
                              const SizedBox(width: 10),
                              SizedBox(
                                  width: 12,
                                  child: Image.asset(AppImages.time)),
                              Text(
                                ' 20-25 mins',
                                style: TextStyle(
                                  fontSize: 9,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
