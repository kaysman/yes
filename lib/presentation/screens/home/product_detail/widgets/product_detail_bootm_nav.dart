import 'package:flutter/material.dart';
import 'package:yes/presentation/shared/colors.dart';

class ProductDetailBottomNav extends StatelessWidget {
  const ProductDetailBottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kWhite,
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
                  color: kText1Color,
                ),
                label: Text(
                  'WISHLIST',
                  style: TextStyle(color: kText1Color, fontSize: 13),
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
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(3),
                ),
                child: TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.shopping_bag_outlined,
                      size: 18,
                      color: kWhite,
                    ),
                    label: Text(
                      'ADD TO BAG',
                      style: TextStyle(color: kWhite, fontSize: 13),
                    ))),
          ),
        ],
      ),
    );
  }
}
