import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/textStyles.dart';
import 'package:food_delivery_app/views/auth/sign_in_screen/sign_in_screen.dart';
import 'package:food_delivery_app/views/home_screen/home_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controllers/auth_controller/auth_controller.dart';
import '../../utils/app_images.dart';
import '../widgets/bottom_nav_bar_widget.dart';
import '../widgets/home_module/widgets/title_widget.dart';
import '../widgets/reusable_elevated_button.dart';

class FirstHomeScreen extends StatefulWidget {
  const FirstHomeScreen({Key? key}) : super(key: key);

  @override
  State<FirstHomeScreen> createState() => _FirstHomeScreenState();
}

class _FirstHomeScreenState extends State<FirstHomeScreen> {
  final authController = Get.put(AuthController());

  String userName = '';

  @override
  void initState() {
    super.initState();
    checkUser();
  }

  void checkUser() async {
    final prefs = await SharedPreferences.getInstance();
    userName = prefs.getString('firstName').toString();
  }

  @override
  Widget build(BuildContext context) {
    print(userName);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///
            /// location login button etc
            ///
            Container(
              height: 240,
              width: size.width,
              color: AppColors.firstHomeScreenContainerColor,
              child: Padding(
                padding: const EdgeInsets.only(top: 48.0, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(AppImages.firstHomeScreenLocationIcon),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextButton.icon(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.keyboard_arrow_down_outlined,
                                color: AppColors.primaryColor,
                              ),
                              label: const Text(
                                'Lahore',
                                style: TextStyle(color: AppColors.primaryColor),
                              )),
                        )
                      ],
                    ),

                    ///
                    /// hey there text
                    //
                    const SizedBox(height: 20),
                    TitleTextWidget(
                        title:
                            userName.isEmpty ? 'Hey there,' : 'Hey $userName'),
                    const SizedBox(height: 4),

                    Text(
                      'Signup or login to get the faster expeirence with the app',
                      style: TextStyle(
                        fontSize: size.width * 0.028,
                      ),
                    ),

                    ///
                    /// login button
                    //
                    const SizedBox(height: 12),
                    SizedBox(
                      width: size.width * 0.35,
                      child: ReusableElevatedButton(
                          textColor: AppColors.whiteColor,
                          btnColor: AppColors.primaryColor,
                          text: 'Login',
                          onPressed: () {
                            Get.offAll(() => SignInScreen());
                          }),
                    )
                  ],
                ),
              ),
            ),

            ///
            ///
            /// categories of food delivery and fresh grocery
            //

            SizedBox(
              width: size.width,
              height: size.height * 0.38,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20, top: 35, bottom: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: reusableContainer(
                        'Food\nDelivery',
                        'Get your favourite food delivered at your doorstep!',
                        AppImages.foodDelivery,
                        size,
                        const Color(0xffE1E0FF),
                        () {
                          Get.to(HomeScreen());
                        },
                      ),
                    ),
                    const SizedBox(width: 22),
                    Expanded(
                      child: reusableContainer(
                        'Shop Fresh\nGrocery',
                        'Shop fresh groceries from neaeby stores',
                        AppImages.freshGrocery,
                        size,
                        const Color(0xffC5FFED),
                        () {
                          Get.to(const HomeScreen());
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            ///
            /// Book a ride section
            //
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        height: size.height * 0.5,
                        width: size.width,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(32),
                                topLeft: Radius.circular(32))),
                        child: Stack(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.42, vertical: 10),
                              child: Container(
                                height: size.height * 0.007,
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(4)),
                              ),
                            ),

                            ///
                            /// close icon
                            //

                            Positioned(
                              right: 20,
                              top: 22,
                              child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.close),
                              ),
                            ),

                            ///
                            /// Location title
                            //
                            const Positioned(
                              left: 20,
                              top: 80,
                              child: TitleTextWidget(title: 'Location'),
                            ),

                            ///
                            /// options for location
                            //
                            Positioned(
                                // right: 20,
                                top: 110,
                                child: SizedBox(
                                  width: size.width,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(height: size.height * 0.01),
                                      ReusableListTile(
                                        title: 'Use current location',
                                        iconData: Icons.my_location_outlined,
                                      ),
                                      const ReusableListTile(
                                        title: 'Lahore',
                                        isSelected: true,
                                        iconData: Icons.home_outlined,
                                        color: AppColors.primaryColor,
                                        textStyle: TextStyle(
                                          color: AppColors.primaryColor,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        trailing: Icon(
                                          Icons.check,
                                          color: Colors.green,
                                        ),
                                      ),
                                      const ReusableListTile(
                                          title: '',
                                          iconData: Icons.home_outlined),
                                      ReusableListTile(
                                          title: 'Kasur',
                                          iconData: Icons.leaderboard_outlined),
                                      ReusableListTile(
                                          title: 'Add new address',
                                          iconData: Icons.add),
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  width: size.width,
                  height: size.height * 0.15,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          spreadRadius: 0,
                          blurRadius: 4,
                          offset: const Offset(0, 4),
                        )
                      ],
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xffFFE1DA)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: reusableText('Book a Ride', null),
                          subtitle: reusableText(
                              'Book now or schedule a taxi near to\nanywhere in the city',
                              TextStyle(
                                fontSize: size.width * 0.023,
                              )),
                        ),
                        Positioned(
                          right: -15,
                          bottom: 0,
                          child: Image.asset(AppImages.bookARideImage),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            ///
            /// Hardware stores section
            //
            Padding(
              padding:
                  const EdgeInsets.only(left: 18.0, right: 18.0, top: 16.0),
              child: InkWell(
                onTap: () {
                  Get.to(HomeScreen());
                },
                child: Container(
                  width: size.width,
                  height: size.height * 0.15,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          spreadRadius: 0,
                          blurRadius: 4,
                          offset: const Offset(0, 4),
                        )
                      ],
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xffFFE1DA)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: reusableText('Hardware stores', null),
                          subtitle: reusableText(
                              'Book now or schedule a taxi near to\nanywhere in the city',
                              TextStyle(
                                fontSize: size.width * 0.023,
                              )),
                        ),
                        Positioned(
                          right: -15,
                          bottom: 0,
                          child: Image.asset(AppImages.bookARideImage),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBarWidget(),
    );
  }
}

Widget reusableText(String text, TextStyle? textStyle) {
  return Text(
    text,
    style: textStyle ??
        const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 17,
        ),
  );
}

Widget reusableContainer(
    String text, desc, image, Size size, Color color, Function()? onTap) {
  return InkWell(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: color,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.25),
                blurRadius: 4.0,
                offset: const Offset(0, 4),
                spreadRadius: 0.0)
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: reusableText(text, null),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: reusableText(
                  //
                  desc,
                  TextStyle(
                    fontSize: size.width * 0.025,
                    fontWeight: FontWeight.w400,
                  )),
            ),

            ///
            /// arrow button
            //
            const Padding(
              padding: EdgeInsets.only(top: 4.0, bottom: 6.0),
              child: Icon(Icons.arrow_forward),
            ),

            ///
            /// image
            //
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: SizedBox(
                width: size.width * 0.25,
                child: Image.asset(image),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class ReusableListTile extends StatelessWidget {
  const ReusableListTile(
      {Key? key,
      required this.title,
      required this.iconData,
      this.trailing,
      this.isSelected = false,
      this.textStyle,
      this.color = Colors.black})
      : super(key: key);
  final String title;
  final IconData iconData;
  final TextStyle? textStyle;
  final Color color;
  final Widget? trailing;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 6),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    iconData,
                    color: color,
                  ),
                  SizedBox(width: size.width * 0.06),
                  Text(
                    title,
                    style: textStyle ??
                        AppTextStyles.sohniFont.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: size.width * 0.04,
                        ),
                  ),
                ],
              ),
              if (isSelected) trailing as Widget,
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}
