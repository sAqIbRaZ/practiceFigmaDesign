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
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: AppColors.whiteColor,
              elevation: 7,
              child: Column(
                children: [
                  SizedBox(
                    width: size.width * 0.43,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset(
                        listOfCousins[index]['imagePath'].toString(),
                        fit: BoxFit.cover,
                        width: size.width * 0.34,
                        height: size.height * 0.15,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 7.0),
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
