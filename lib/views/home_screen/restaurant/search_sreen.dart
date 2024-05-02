import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_app/views/home_screen/widgets/search_screen_resuable_hot_searches_widget.dart';
import 'package:food_delivery_app/views/home_screen/widgets/show_serached_restaurant_widget.dart';
import 'package:get/get.dart';

import '../../../controllers/home_module/home_controller.dart';
import '../../../utils/app_images.dart';
import '../../../utils/colors.dart';
import '../../../widgets/reusable_textfield.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchController = TextEditingController();
  final homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Search',
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: size.width * 0.055),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            homeController.stopSearchingFunction();

            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(size.width * 0.03),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.03),
              Center(
                child: Obx(() => ReusableTextField(
                      onTap: () {
                        homeController.startSearchingFunction();
                      },
                      suffixWidget: homeController.isSearching.value
                          ? Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                InkWell(
                                    onTap: () {
                                      print('close search');
                                      searchController.text = '';
                                      homeController.stopSearchingFunction();
                                      FocusScope.of(context).unfocus();
                                    },
                                    child: SvgPicture.asset(
                                        AppImages.closeSearchIcon)),
                                const SizedBox(width: 10),
                                Image.asset(AppImages.lineSearchHomeIcon),
                                const SizedBox(width: 10),
                                Image.asset(AppImages.homeSearchBarSuffixIcon),
                              ],
                            )
                          : const SizedBox(),
                      controller: searchController,
                      onChanged: (value) {
                        print(value);
                        setState(() {});
                      },
                      textFieldColor: AppColors.whiteColor,
                      hintText: 'Search near Lahore..',
                      hintTextStyle: const TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                      ),
                      prefixWidget: const Icon(CupertinoIcons.search),
                      borderColor: AppColors.whiteColor,
                    )),
              ),
              SizedBox(height: size.height * 0.03),

              (homeController.isSearching.value &&
                      searchController.text.isNotEmpty)
                  ? Row(
                      children: [
                        const Text('Searching near '),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.expand_more_rounded,
                              color: AppColors.primaryColor,
                            ),
                            label: Text(
                              'Lahore',
                              style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: size.width * 0.035),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Image.asset(AppImages.popularSearches),

              ///
              ///
              /// popular searches
              ///
              //
              SizedBox(height: size.width * 0.05),

              (homeController.isSearching.value &&
                      searchController.text.isNotEmpty)
                  ? SizedBox(
                      height: size.height * 0.4,
                      child: ShowRestaurantsWidget(),
                    )
                  : Column(
                      children: [
                        Row(
                          children: [
                            HotSearchesWidget(
                                title: 'Hot wings',
                                onTap: () {
                                  searchController.text = 'Hot wings';
                                  homeController.startSearchingFunction();

                                  setState(() {});
                                }),
                            SizedBox(width: size.width * 0.02),
                            HotSearchesWidget(
                                title: 'Burger',
                                onTap: () {
                                  searchController.text = 'Burger';
                                  homeController.startSearchingFunction();

                                  setState(() {});
                                }),
                            SizedBox(width: size.width * 0.02),
                            HotSearchesWidget(
                                title: 'Sushi',
                                onTap: () {
                                  searchController.text = 'Sushi';
                                  homeController.startSearchingFunction();

                                  setState(() {});
                                }),
                            SizedBox(width: size.width * 0.02),
                            HotSearchesWidget(
                                title: 'Pizza',
                                onTap: () {
                                  searchController.text = 'Pizza';
                                  setState(() {});
                                  homeController.startSearchingFunction();
                                }),
                          ],
                        ),
                        SizedBox(height: size.width * 0.02),
                        Row(
                          children: [
                            HotSearchesWidget(
                                title: 'Soup',
                                onTap: () {
                                  searchController.text = 'Soup';
                                  homeController.startSearchingFunction();

                                  setState(() {});
                                }),
                            SizedBox(width: size.width * 0.02),
                            HotSearchesWidget(
                                title: 'Sweets',
                                onTap: () {
                                  searchController.text = 'Sweets';
                                  homeController.startSearchingFunction();

                                  setState(() {});
                                }),
                            SizedBox(width: size.width * 0.02),
                            HotSearchesWidget(
                                title: 'Risa',
                                onTap: () {
                                  searchController.text = 'Risa';
                                  homeController.startSearchingFunction();

                                  setState(() {});
                                }),
                            SizedBox(width: size.width * 0.02),
                            HotSearchesWidget(
                                title: 'Sandwich',
                                onTap: () {
                                  searchController.text = 'Sandwich';
                                  homeController.startSearchingFunction();

                                  setState(() {});
                                }),
                          ],
                        ),
                        SizedBox(height: size.width * 0.02),
                        Row(
                          children: [
                            HotSearchesWidget(
                                title: 'Bowl',
                                onTap: () {
                                  searchController.text = 'Bowl';
                                  homeController.startSearchingFunction();

                                  setState(() {});
                                }),
                            SizedBox(width: size.width * 0.02),
                            HotSearchesWidget(
                                title: 'Grilled fish',
                                onTap: () {
                                  searchController.text = 'Grilled fish';
                                  homeController.startSearchingFunction();

                                  setState(() {});
                                }),
                            SizedBox(width: size.width * 0.02),
                            HotSearchesWidget(
                                title: 'Pepsi',
                                onTap: () {
                                  searchController.text = 'Pepsi';
                                  homeController.startSearchingFunction();

                                  setState(() {});
                                }),
                            SizedBox(width: size.width * 0.02),
                            HotSearchesWidget(
                                title: 'Chicken tikka',
                                onTap: () {
                                  searchController.text = 'Chicken tikka';
                                  homeController.startSearchingFunction();

                                  setState(() {});
                                }),
                          ],
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
