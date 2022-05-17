import 'package:flutter/material.dart';
import 'package:yes_demo/helpers/colors.dart';

class ProductDetailBottomNav extends StatelessWidget {
  const ProductDetailBottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: whiteColor,
      height: 55,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1.2, color: Colors.grey[200]!),
                  borderRadius: BorderRadius.circular(3)),
              child: TextButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite_border_outlined,
                  size: 18,
                  color: text1Color,
                ),
                label: Text(
                  'WISHLIST',
                  style: TextStyle(color: text1Color, fontSize: 13),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 6,
          ),
          Expanded(
            flex: 5,
            child: Container(
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(3),
                ),
                child: TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.shopping_bag_outlined,
                      size: 18,
                      color: whiteColor,
                    ),
                    label: Text(
                      'ADD TO BAG',
                      style: TextStyle(color: whiteColor, fontSize: 13),
                    ))),
          ),
        ],
      ),
    );
  }
}
