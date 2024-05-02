import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_app/utils/app_images.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/views/profile/widget/reusable_saved_address_widget.dart';
import 'package:food_delivery_app/widgets/reusable_elevated_button.dart';

import '../../utils/textStyles.dart';

class SavedAddressesScreen extends StatelessWidget {
  const SavedAddressesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Saved address',
          style: AppTextStyles.sohniFont.copyWith(
            fontSize: size.width * 0.05,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: [
            //
            SizedBox(height: size.height * 0.08),
            const ReusableSavedAddressWidget(
                title: 'DHA, Lahore', subtitle: ''),

            SizedBox(height: size.height * 0.04),

            const ReusableSavedAddressWidget(
                title: 'Wapda Town',
                subtitle: 'Hosue 123 building 28 Street #1, Lahore 54800 '),
            SizedBox(height: size.height * 0.04),

            const ReusableSavedAddressWidget(
                title: 'DHA, Lahore',
                subtitle: 'Hosue 123 building 28 Street #1, Lahore 54800 '),

            ///
            /// add new address
            ///
            //
            SizedBox(height: size.height * 0.06),

            SizedBox(
              width: size.width,
              child: ReusableElevatedButton(
                textColor: AppColors.primaryColor,
                btnColor: AppColors.whiteColor,
                text: '+ Add new address',
                onPressed: () {},
                borderSideColor: AppColors.primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
