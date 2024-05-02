import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_app/utils/app_images.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/views/home_screen/restaurant/nearby_restaurant.dart';
import 'package:food_delivery_app/views/home_screen/restaurant/search_sreen.dart';
import 'package:food_delivery_app/views/home_screen/restaurant/top_cousins_screen.dart';
import 'package:food_delivery_app/views/home_screen/widgets/title_widget.dart';
import 'package:food_delivery_app/widgets/reusable_textfield.dart';
import 'package:get/get.dart';

import '../../widgets/bottom_nav_bar_widget.dart';
import 'restaurant/empty_basket_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final topCousinsList = [
    {'title': 'Italian', 'imagePath': AppImages.cousins1},
    {'title': 'Chinese', 'imagePath': AppImages.cousins2},
    {'title': 'Italian', 'imagePath': AppImages.cousins1},
    {'title': 'Italian', 'imagePath': AppImages.cousins1},
    {'title': 'Italian', 'imagePath': AppImages.cousins1},
    {'title': 'Chinese', 'imagePath': AppImages.cousins2},
  ];
  final listOfRestaurant = [
    AppImages.popularRestaurnat1,
    AppImages.popularRestaurnat2,
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.05),
              Row(
                children: [
                  // SizedBox(width: size.width * 0.02),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_back),
                  ),
                  SizedBox(width: size.width * 0.02),
                  SvgPicture.asset(AppImages.lahoreLocationHome),
                  SizedBox(width: size.width * 0.3),
                  InkWell(
                      onTap: () {
                        Get.to(() => EmptyBasketScreen());
                      },
                      child: SvgPicture.asset(AppImages.homeBasketIcon)),
                ],
              ),
              SizedBox(height: size.height * 0.01),
              ReusableTextField(
                readOnly: true,
                onTap: () {
                  Get.to(() => SearchScreen());
                },
                textFieldColor: AppColors.whiteColor,
                hintText: 'Search for food restaurants..',
                hintTextStyle: const TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                ),
                prefixWidget: const Icon(CupertinoIcons.search),
                borderColor: AppColors.whiteColor,
                suffixWidget: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(AppImages.lineSearchHomeIcon),
                    const SizedBox(width: 6),
                    Image.asset(AppImages.homeSearchBarSuffixIcon),
                  ],
                ),
              ),

              ///
              /// top cuisine
              //
              // SizedBox(height: size.height * 0.03),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 7.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const TitleTextWidget(
                      title: 'Top Cousins',
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => TopCousinsScreen(
                              listOfCousins: topCousinsList,
                            ));
                      },
                      child: Text(
                        'See all',
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: size.width * 0.034,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.21,
                width: size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: topCousinsList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Card(
                        elevation: 7,
                        child: Column(
                          children: [
                            Image.asset(
                              topCousinsList[index]['imagePath'].toString(),
                              fit: BoxFit.fitHeight,
                            ),
                            const SizedBox(width: 10),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 3.0),
                              child: Text(
                                  topCousinsList[index]['title'].toString()),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              ///
              /// popular restaurnats
              ///
              //

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const TitleTextWidget(
                      title: 'Popular restaurants',
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'See all',
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: size.width * 0.034,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: size.height * 0.22,
                width: size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: listOfRestaurant.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: size.width * 0.7,
                      child: Card(
                          elevation: 7,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                listOfRestaurant[index],
                                fit: BoxFit.fitWidth,
                                height: size.height * 0.14,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 8.0, top: 6),
                                child: Text(
                                  'Masooma’s Kitchen - DHA',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 9,
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Text(
                                  'Roast, chicken, ice-cream...',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 8,
                                  ),
                                ),
                              ),

                              ///
                              /// ratings
                              ///
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
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
                                    SizedBox(width: 10),
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
                              )
                            ],
                          )),
                    );
                  },
                ),
              ),

              ///
              ///Nearby restaurants
              ///
              ///
              //
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const TitleTextWidget(
                      title: 'Nearby restaurants',
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'See all',
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: size.width * 0.034,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: size.height * 0.215,
                width: size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: listOfRestaurant.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: size.width * 0.7,
                      child: InkWell(
                        onTap: () {
                          print('GO to restaruant detail screen');
                          Get.to(() => NearbyRestaurantScreen());
                        },
                        child: Card(
                            elevation: 7,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(6),
                                  child: Image.asset(
                                    AppImages.nearbyRestaurant,
                                    fit: BoxFit.fitWidth,
                                    height: size.height * 0.14,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 8.0, top: 4),
                                  child: Text(
                                    'Mcdonald\'s - DHA',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 9,
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    'Fast Food. Fresh. Steaks',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 8,
                                    ),
                                  ),
                                ),

                                ///
                                /// ratings
                                ///
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
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
                                )
                              ],
                            )),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavBarWidget(),
    );
  }
}
