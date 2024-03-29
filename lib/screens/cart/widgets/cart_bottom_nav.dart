import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:yes_demo/helpers/colors.dart';
import 'package:yes_demo/screens/cart/cart_screen.dart';

class CartBottomNav extends StatelessWidget {
  const CartBottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            alignment: Alignment.center,
            color: Color.fromARGB(255, 255, 234, 240),
            child: Text(
              '1 Item selected for order',
              style: TextStyleUtils().smallboldText,
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: primaryColor),
                onPressed: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    'PLACE ORDER',
                    style: TextStyle(
                        color: whiteColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
