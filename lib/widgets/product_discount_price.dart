import 'package:flutter/material.dart';

import '../helpers/colors.dart';

class ProductDiscountPrice extends StatelessWidget {
  const ProductDiscountPrice({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: '14.796TMT',
          style: TextStyle(
            color: Colors.grey[400],
            decoration: TextDecoration.lineThrough,
            fontSize: 12,
          ),
          children: [
            TextSpan(
              text: '  3.548TMT  ',
              style: TextStyle(
                  color: text1Color,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.none),
            ),
            TextSpan(
              text: '76% OFF',
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 12,
                  decoration: TextDecoration.none),
            ),
            // Text.rich(
            //   TextSpan(
            //     text: "TMT",
            //     style: TextStyle(
            //         fontSize: 11, color: text1Color),
            //   ),
            // )
          ]),
    );
  }
}
