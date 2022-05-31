import 'package:flutter/material.dart';
import 'package:yes/presentation/shared/colors.dart';

class CustomCheckBox extends StatefulWidget {
  final Color? color;
  CustomCheckBox({Key? key, this.color}) : super(key: key);

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool isChecked = false;
  void onChecked() {
    setState(() {
      isChecked = !isChecked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onChecked,
        child: Container(
            width: 18,
            height: 18,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                // color: widget.color,
                border: Border.all(
                    width: 1, color: isChecked ? kPrimaryColor : kText1Color),
                borderRadius: BorderRadius.circular(3),
                color: isChecked ? kPrimaryColor : widget.color),
            child: isChecked
                ? Icon(
                    Icons.check,
                    size: 15,
                    color: kWhite,
                  )
                : null));
  }
}
