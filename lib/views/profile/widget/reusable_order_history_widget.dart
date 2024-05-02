import 'package:flutter/material.dart';

import '../../../utils/app_images.dart';
import '../../../utils/textStyles.dart';

class ReusableOrderHistoryWidget extends StatelessWidget {
  const ReusableOrderHistoryWidget({Key? key, this.onTap}) : super(key: key);
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: size.width,
        height: size.height * 0.21,
        child: Stack(
          children: [
            Positioned(
              top: size.height * 0.017,
              left: size.width * 0.04,
              child: Image.asset(
                AppImages.myOrderFood,
                width: size.width * 0.28,
              ),
            ),
            Positioned(
              left: size.width * 0.38,
              top: size.height * 0.025,
              child: Text(
                'Pizza Hut',
                style: AppTextStyles.sohniFont.copyWith(
                    fontWeight: FontWeight.w600, fontSize: size.width * 0.045),
              ),
            ),
            Positioned(
              top: size.height * 0.023,
              right: size.width * 0.06,
              child: Text(
                'Order#12345',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: size.width * 0.03,
                ),
              ),
            ),
            Positioned(
              left: size.width * 0.38,
              top: size.height * 0.06,
              child: Text('H block, DHA..',
                  style: TextStyle(
                      fontSize: size.width * 0.028,
                      color: Colors.grey.shade800)),
            ),
            Positioned(
              left: size.width * 0.38,
              top: size.height * 0.09,
              child: Text('x2 large pizza, x1 soft drink',
                  style: TextStyle(
                      fontSize: size.width * 0.025,
                      color: Colors.grey.shade600)),
            ),
            Positioned(
              left: size.width * 0.38,
              top: size.height * 0.12,
              child: Text('Total:',
                  style: TextStyle(
                      fontSize: size.width * 0.025,
                      color: Colors.grey.shade600)),
            ),
            Positioned(
              left: size.width * 0.46,
              top: size.height * 0.12,
              child: Text(' 89.00 \$ ',
                  style: TextStyle(
                      fontSize: size.width * 0.028,
                      fontWeight: FontWeight.w600)),
            ),
            Positioned(
              left: size.width * 0.045,
              top: size.height * 0.16,
              child: Text('Feb 14, 2022\n04:20 pm',
                  style: TextStyle(
                      fontSize: size.width * 0.026,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w400)),
            ),
            Positioned(
              right: size.width * 0.04,
              top: size.height * 0.16,
              child: Text('Delivered!',
                  style: TextStyle(
                      fontSize: size.width * 0.035,
                      color: const Color(0xff3CCA64),
                      fontWeight: FontWeight.w400)),
            ),

            // Text(''),
          ],
        ),
      ),
    );
  }
}
