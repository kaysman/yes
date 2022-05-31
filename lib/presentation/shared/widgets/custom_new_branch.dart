import 'package:flutter/material.dart';
import 'package:yes/presentation/shared/colors.dart';


class CustomNewBranch extends StatelessWidget {
  final EdgeInsets padding;
  final double fontSize;
  const CustomNewBranch({
    Key? key,
    required this.padding, required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: kPrimaryColor,
      ),
      child: Text(
        'New',
        style: TextStyle(color: kWhite, fontSize: fontSize),
      ),
    );
  }
}
