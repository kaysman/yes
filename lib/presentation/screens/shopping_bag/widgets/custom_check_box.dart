import 'package:flutter/material.dart';
import 'package:yes/presentation/shared/colors.dart';

class CustomCheckBox extends StatelessWidget {
  final Color? color;
  final bool isChecked;
  final ValueChanged<bool> onTapped;
  CustomCheckBox({
    Key? key,
    this.color,
    required this.isChecked,
    required this.onTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTapped.call(!this.isChecked),
      child: Container(
        width: 18,
        height: 18,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(
                width: 1, color: isChecked ? kPrimaryColor : kText1Color),
            borderRadius: BorderRadius.circular(3),
            color: isChecked ? kPrimaryColor : color),
        child: isChecked
            ? Icon(
                Icons.check,
                size: 15,
                color: kWhite,
              )
            : null,
      ),
    );
  }
}
