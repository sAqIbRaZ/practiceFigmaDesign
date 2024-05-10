import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/colors.dart';

import '../../../utils/textStyles.dart';

class TopCousinsScreen extends StatelessWidget {
  const TopCousinsScreen({Key? key, required this.listOfCousins})
      : super(key: key);
  final List listOfCousins;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Top Cousins',
            style: AppTextStyles.sohniFont.copyWith(
              fontSize: size.width * 0.05,
            ),
          )),
      body: GridView.builder(
        itemCount: listOfCousins.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              top: 20,
              bottom: 20,
              right: 20,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: AppColors.whiteColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black
                        .withOpacity(0.25), // Adjust color as needed
                    blurRadius: 4.0, // Adjust blur radius as needed
                    spreadRadius: 0.0, // Adjust spread radius as needed
                    offset: const Offset(0.0, 4.0), // Adjust offset as needed
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: size.width * 0.455,
                    height: size.height * 0.13,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset(
                        listOfCousins[index]['imagePath'].toString(),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      listOfCousins[index]['title'].toString(),
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
