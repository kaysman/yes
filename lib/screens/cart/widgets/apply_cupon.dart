import 'package:flutter/material.dart';
import 'package:yes_demo/helpers/colors.dart';
import 'package:yes_demo/screens/cart/cart_screen.dart';
import 'package:yes_demo/screens/cart/widgets/my_container.dart';


class ApplyCupon extends StatelessWidget {
  const ApplyCupon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // print('object');
      },
      child: MyContainer(
        pVertical: 12,
        pHorizontal: 12,
        widget:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.discount_outlined,
                color: text1Color,
                size: 18,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Apply Coupon',
                style: TextStyleUtils().smallboldText,
              ),
            ],
          ),
          Icon(
            Icons.chevron_right_rounded,
            color: text1Color,
            size: 18,
          ),
        ]),
      ),
    );
  }
}
