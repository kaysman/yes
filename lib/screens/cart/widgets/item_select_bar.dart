import 'package:flutter/material.dart';
import 'package:yes_demo/helpers/colors.dart';
import 'package:yes_demo/screens/cart/cart_screen.dart';
import 'custom_check_box.dart';


class ItemSelectBar extends StatefulWidget {
  const ItemSelectBar({
    Key? key,
  }) : super(key: key);

  @override
  State<ItemSelectBar> createState() => _ItemSelectBarState();
}

class _ItemSelectBarState extends State<ItemSelectBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomCheckBox(),
                SizedBox(
                  width: 10,
                ),
                Text.rich(TextSpan(
                    text: '0/2 ITEMS SELECTED',
                    style: TextStyleUtils().boldText,
                    children: [
                      TextSpan(
                          text: ' (4,297TMT)',
                          style: TextStyle(color: primaryColor))
                    ]))
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                Icon(
                  Icons.delete,
                  color: text1Color,
                  size: 20,
                ),
                SizedBox(
                  width: 15,
                ),
                Icon(
                  Icons.favorite_outline_rounded,
                  color: text1Color,
                  size: 20,
                )
              ],
            ),
          )
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal:10, vertical: 15),
    );
  }
}
