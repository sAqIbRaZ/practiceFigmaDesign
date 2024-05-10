import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/controllers/home_module/home_controller.dart';
import 'package:food_delivery_app/utils/app_images.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/textStyles.dart';
import 'package:food_delivery_app/views/home_screen/restaurant/restaurant_more_info_screen.dart';
import 'package:get/get.dart';

import '../../widgets/home_module/widgets/hot_selling_content_widget.dart';

class RestaurantDetailScreen extends StatefulWidget {
  const RestaurantDetailScreen(
      {Key? key, required this.title, required this.imagePath})
      : super(key: key);
  final String title;
  final String imagePath;

  @override
  State<RestaurantDetailScreen> createState() => _RestaurantDetailScreenState();
}

class _RestaurantDetailScreenState extends State<RestaurantDetailScreen> {
  final scrollController = ScrollController();
  //
  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.offset >= 100.0) {
        print(scrollController.offset);
        print('hide title');
        homeController.showAppBarTitleFunction();
      } else {
        homeController.hideAppBarTitleFunction();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    print('dispose is called');
    homeController.hideAppBarTitleFunction();
    super.dispose();
  }

  final homeController = Get.put(HomeController());

  bool isAppBarCollapsed = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        body: Stack(
      children: [
        CustomScrollView(
          controller: scrollController,
          slivers: [
            ///
            /// image
            ///
            SliverAppBar(
              automaticallyImplyLeading: isAppBarCollapsed,
              leading: Stack(
                children: [
                  Positioned(
                    top: size.height * 0.01,
                    left: size.width * 0.04,
                    child: Obx(() => Container(
                          height: size.height * 0.05,
                          width: size.height * 0.05,
                          decoration: BoxDecoration(
                              color: homeController.isAppBarClosed.value
                                  ? Colors.transparent
                                  : AppColors
                                      .whiteColor, // white color for the back arrow button
                              shape: BoxShape.circle),
                        )),
                  ),
                  Positioned(
                      top: size.height * 0.003,
                      left: size.width * 0.025,
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back))),
                ],
              ),
              primary: true, //////////////////////////////not checked yet.0
              pinned: true, // hide the appbar when swipe up
              expandedHeight: size.height * 0.18,
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                background: SizedBox(
                  height: size.height * 0.081,
                  child: Image.asset(
                    widget.imagePath,
                    fit: BoxFit.fill,
                  ),
                ),
                title: Obx(() => Text(
                      homeController.isAppBarClosed.value ? widget.title : '',
                      style: AppTextStyles.sohniFont.copyWith(
                        color: Colors.black,
                        fontSize: size.width * 0.045,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
              ),
            ),

            ///
            /// title reviews and more info
            //

            SliverList(
                delegate: SliverChildListDelegate([
              SizedBox(
                height: size.height * 0.165,
                width: size.width,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: size.width * 0.05, top: size.height * 0.012),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title,
                            style: AppTextStyles.sohniFont.copyWith(
                              fontSize: size.width * 0.05,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Broast, chicken, icecream, hot cofee, drinks ',
                            style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: size.width * 0.03),
                          ),
                          SizedBox(height: size.height * 0.01),

                          ///
                          /// avatar icon and reviews
                          ///
                          //
                          Row(
                            children: [
                              Image.asset(AppImages.avatar,
                                  width: size.width * 0.065),
                              const Text(' 4.8 '),
                              Text(
                                '(225 ',
                                style: AppTextStyles.sohniFont.copyWith(
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.w300),
                              ),
                              Text(
                                'Reviews',
                                style: AppTextStyles.sohniFont.copyWith(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.w300,
                                  decoration: TextDecoration.underline,
                                  decorationColor: AppColors.primaryColor,
                                ),
                              ),
                              Text(
                                ') ',
                                style: AppTextStyles.sohniFont.copyWith(
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.w300),
                              ),

                              ///
                              ///more info button
                              //
                              Padding(
                                padding:
                                    EdgeInsets.only(left: size.width * 0.25),
                                child: InkWell(
                                  onTap: () {
                                    Get.to(() => RestaurantMoreInfoScreen(
                                        title: widget.title));
                                  },
                                  child: Container(
                                    height: size.height * 0.034,
                                    width: size.width * 0.2,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: const Color(0xffFFE1DA),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Text(
                                      'More info',
                                      style: AppTextStyles.sohniFont.copyWith(
                                          color: AppColors.primaryColor,
                                          fontWeight: FontWeight.w500,
                                          fontSize: size.width * 0.025),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.01),
                    SizedBox(
                      width: size.width,
                      child: const Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ])),

            ///
            /// food categories
            ///
            //
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  padding: const EdgeInsets.all(8.0),
                  width: size.width,
                  height: size.height * 0.89,
                  child: ContainedTabBarView(
                    tabBarProperties: TabBarProperties(
                        height: size.height * 0.04,
                        width: size.width * 0.935,
                        labelColor: AppColors.primaryColor,
                        labelStyle: TextStyle(
                            fontSize: size.width * 0.033,
                            fontWeight: FontWeight.w500),
                        // labelPadding: const EdgeInsets.symmetric(vertical: 0),
                        indicatorColor: AppColors.primaryColor,
                        indicatorPadding: EdgeInsets.zero,
                        unselectedLabelStyle:
                            const TextStyle(fontWeight: FontWeight.w500)),
                    tabs: const [
                      Text('Hot selling'),
                      Text('Broast'),
                      Text('Drinks'),
                      Text('Starters'),
                      Text('Pizza'),
                    ],
                    views: [
                      HotSellingContentWidget(),
                      HotSellingContentWidget(),
                      HotSellingContentWidget(),
                      HotSellingContentWidget(),
                      HotSellingContentWidget(),
                    ],
                    onChange: (index) => print(index),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ],
    ));
  }
}
