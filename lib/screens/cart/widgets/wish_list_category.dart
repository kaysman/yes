import 'package:flutter/material.dart';

import '../../../helpers/colors.dart';
import '../cart_screen.dart';

class WhishListCategory extends StatefulWidget {
  final bool onSelected;
  final String title;
  const WhishListCategory({
    Key? key,
    required this.title,
    required this.onSelected,
  }) : super(key: key);

  @override
  State<WhishListCategory> createState() => _WhishListCategoryState();
}

class _WhishListCategoryState extends State<WhishListCategory> {
 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
                width: 1,
                color: widget.onSelected ? primaryColor : text1Color)),
        child: Text(
          widget.title,
          style: TextStyleUtils().boldText,
        ),
      ),
    );
  }
}
