import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/app_images.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/views/home_screen/restaurant/restaurant_detail_screen.dart';
import 'package:get/get.dart';

class ShowRestaurantsWidget extends StatelessWidget {
  ShowRestaurantsWidget({Key? key}) : super(key: key);
  final listOfRestaurants = [
    {'title': 'Subawy - Johar Town', 'imagePath': AppImages.subway},
    {'title': 'Mcdonald’s - DHA', 'imagePath': AppImages.macdonaldRestaurant},
    {'title': 'KFC - Johar Town', 'imagePath': AppImages.kfcRestaurant}
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView.builder(
      itemCount: listOfRestaurants.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              print('Go to restaurant detail screen');
              Get.to(() => RestaurantDetailScreen(
                  title: listOfRestaurants[index]['title'].toString(),
                  imagePath: listOfRestaurants[index]['imagePath'].toString()));
            },
            child: SizedBox(
              width: size.width,
              child: Stack(
                children: [
                  Image.asset(listOfRestaurants[index]['imagePath'].toString()),
                  Positioned(
                    left: size.width * 0.25,
                    child: Text(listOfRestaurants[index]['title'].toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: size.width * 0.035,
                        )),
                  ),
                  Positioned(
                      left: size.width * 0.25,
                      top: size.width * 0.06,
                      child: Text(
                        'Fast Food. Fresh. Steaks',
                        style: TextStyle(
                            fontSize: size.width * 0.03,
                            color: Colors.grey.shade600),
                      )),
                  Positioned(
                      left: size.width * 0.25,
                      top: size.width * 0.12,
                      child: Row(
                        children: [
                          SizedBox(
                              height: size.width * 0.05,
                              child: Image.asset(AppImages.searchRating)),
                          const SizedBox(width: 10),
                          SizedBox(
                              height: size.width * 0.05,
                              child: Image.asset(AppImages.searchRide)),
                          const SizedBox(width: 10),
                          SizedBox(
                              height: size.width * 0.05,
                              child: Image.asset(AppImages.searchC)),
                        ],
                      )),

                  // time to delivered

                  Positioned(
                    top: size.width * 0.01,
                    right: size.width * 0.01,
                    child: Container(
                      alignment: Alignment.center,
                      height: size.height * 0.025,
                      width: size.width * 0.17,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: AppColors.primaryColorLow,
                      ),
                      child: Text(
                        '20-35 mins',
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: size.width * 0.025),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
