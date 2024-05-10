import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_app/controllers/home_module/home_controller.dart';
import 'package:food_delivery_app/utils/app_images.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/views/home_screen/restaurant/items_in_basket_screen.dart';
import 'package:food_delivery_app/views/home_screen/restaurant/nearby_restaurant.dart';
import 'package:food_delivery_app/views/home_screen/restaurant/search_sreen.dart';
import 'package:food_delivery_app/views/home_screen/restaurant/top_cousins_screen.dart';
import 'package:get/get.dart';

import '../widgets/home_module/widgets/title_widget.dart';
import '../widgets/reusable_textfield.dart';
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

  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.05),
              Row(
                children: [
                  // SizedBox(width: size.width * 0.02),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                  SizedBox(width: size.width * 0.02),
                  SvgPicture.asset(AppImages.lahoreLocationHome),
                  SizedBox(width: size.width * 0.3),
                  InkWell(
                      onTap: () {
                        print(
                            homeController.isItemsAddedToCart.value.toString());

                        Get.to(() => homeController.isItemsAddedToCart.value
                            ? ItemsInBasketsScreen()
                            : const EmptyBasketScreen());
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
                    return Card(
                      color: AppColors.whiteColor,
                      elevation: 6,
                      child: Column(
                        children: [
                          SizedBox(
                            width: size.width * 0.34,
                            height: size.height * 0.15,
                            child: Image.asset(
                              topCousinsList[index]['imagePath'].toString(),
                              fit: BoxFit.fill,
                            ),
                          ),
                          // const SizedBox(width: 15),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 3.0),
                            child:
                                Text(topCousinsList[index]['title'].toString()),
                          ),
                        ],
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
                height: size.height * 0.27,
                width: size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: listOfRestaurant.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: size.width * 0.7,
                      child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                          color: AppColors.whiteColor,
                          elevation: 7,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: size.height * 0.15,
                                width: size.width,
                                child: Image.asset(
                                  listOfRestaurant[index],
                                  fit: BoxFit.fill,
                                  // height: size.height * 0.14,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8.0, top: 4),
                                child: Text(
                                  'Masooma’s Kitchen - DHA',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: size.width * 0.036,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8.0, top: 2),
                                child: Text(
                                  'Roast, chicken, ice-cream...',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: size.width * 0.027,
                                  ),
                                ),
                              ),

                              ///
                              /// ratings
                              ///
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, top: 8, bottom: 8),
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
                height: size.height * 0.27,
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
                          Get.to(() => const NearbyRestaurantScreen());
                        },
                        child: Card(
                          color: AppColors.whiteColor,
                          elevation: 7,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(6),
                                child: Image.asset(
                                  AppImages.nearbyRestaurant,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8.0, top: 8),
                                child: Text(
                                  'Mcdonald\'s - DHA',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: size.width * 0.04,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8.0, top: 4),
                                child: Text(
                                  'Fast Food. Fresh. Steaks',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: size.width * 0.027,
                                  ),
                                ),
                              ),

                              ///
                              /// ratings
                              ///
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8.0, top: 8),
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

                              ///
                              /// space
                              //
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: size.height * 0.04),
            ],
          ),
        ),
      ),
    );
  }
}
