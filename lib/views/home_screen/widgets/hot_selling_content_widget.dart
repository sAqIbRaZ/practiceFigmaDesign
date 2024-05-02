import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/utils/app_images.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/textStyles.dart';
import 'package:food_delivery_app/views/home_screen/restaurant/food_detail_screen.dart';
import 'package:get/get.dart';

class HotSellingContentWidget extends StatelessWidget {
  HotSellingContentWidget({Key? key}) : super(key: key);

  final listOfFoods = [
    {
      'title': 'Food platter',
      'imagePath': AppImages.foodPlatter,
      'desc': 'In size of your choice with jalapenos..',
      'price': '2.24 \$'
    },
    {
      'title': 'Chicken wings',
      'imagePath': AppImages.chickenWings,
      'desc': 'Crispy chicken wings with choice of souces',
      'price': '2.00 \$'
    },
    {
      'title': 'Chili wings',
      'imagePath': AppImages.chilliWings,
      'desc': 'In size of your choice...',
      'price': '3.06 \$'
    },
    {
      'title': 'Chicken crispy',
      'imagePath': AppImages.chickenCrispy,
      'desc': 'In size of your choice..',
      'price': '3.06 \$'
    },
    {
      'title': 'Fried rice',
      'imagePath': AppImages.firedRice,
      'desc': 'In size of your choice..',
      'price': '3.06 \$'
    },
    {
      'title': 'Food platter',
      'imagePath': AppImages.foodPlatter,
      'desc': 'In size of your choice with jalapenos..',
      'price': '2.24 \$'
    },
    {
      'title': 'Chicken wings',
      'imagePath': AppImages.chickenWings,
      'desc': 'Crispy chicken wings with choice of souces',
      'price': '2.00 \$'
    },
    {
      'title': 'Chili wings',
      'imagePath': AppImages.chilliWings,
      'desc': 'In size of your choice...',
      'price': '3.06 \$'
    },
    {
      'title': 'Chicken crispy',
      'imagePath': AppImages.chickenCrispy,
      'desc': 'In size of your choice..',
      'price': '3.06 \$'
    },
    {
      'title': 'Fried rice',
      'imagePath': AppImages.firedRice,
      'desc': 'In size of your choice..',
      'price': '3.06 \$'
    }
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Hot Selling ',
                  style: AppTextStyles.sohniFont.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: size.width * 0.045,
                  ),
                ),
                Image.asset(AppImages.fire),
              ],
            ),
            Text(
              'minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia Ame',
              style: TextStyle(
                color: Colors.grey,
                fontSize: size.width * 0.03,
                fontWeight: FontWeight.w300,
              ),
            ),

            ///
            /// food items
            ///
            //

            Flexible(
              child: ListView.builder(
                itemCount: listOfFoods.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: InkWell(
                      onTap: () {
                        print('go to food detail screen');
                        Get.to(() => FoodDetailScreen(
                              title: listOfFoods[index]['title'].toString(),
                            ));
                      },
                      child: Stack(
                        children: [
                          Image.asset(
                              listOfFoods[index]['imagePath'].toString()),
                          Positioned(
                            left: size.width * 0.25,
                            child: Text(
                              listOfFoods[index]['title'].toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: size.width * 0.035,
                              ),
                            ),
                          ),
                          Positioned(
                            left: size.width * 0.25,
                            top: size.width * 0.07,
                            child: Text(
                              listOfFoods[index]['desc'].toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: size.width * 0.03,
                              ),
                            ),
                          ),
                          Positioned(
                            left: size.width * 0.25,
                            top: size.width * 0.13,
                            child: Text(
                              listOfFoods[index]['price'].toString(),
                              style: AppTextStyles.sohniFont.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: size.width * 0.03,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: size.height * 0.24),
          ],
        ),
      ),
    );
  }
}
