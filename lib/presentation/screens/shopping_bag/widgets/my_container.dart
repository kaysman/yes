import 'package:flutter/material.dart';
import 'package:yes/presentation/shared/colors.dart';

class MyContainer extends StatelessWidget {
  final double pVertical;
  final double pHorizontal;
  final Widget widget;
  const MyContainer({Key? key, required this.pVertical, required this.pHorizontal, required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
      color: kWhite,
      padding:  EdgeInsets.symmetric(
          vertical: pVertical, horizontal: pHorizontal),
          child: widget,
          
    );
  }
}
