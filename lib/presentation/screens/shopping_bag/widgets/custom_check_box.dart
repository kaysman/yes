import 'package:flutter/material.dart';
import 'package:yes/presentation/shared/colors.dart';

class CustomCheckBox extends StatefulWidget {
  final Color? color;
  final bool isChecked;
  final Function() onTapped;
  CustomCheckBox({Key? key, this.color,  required this.isChecked, required this.onTapped}) : super(key: key);

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  @override
  Widget build(BuildContext context) {
        return InkWell(
            onTap: widget.onTapped,
            child: Container(
                width: 18,
                height: 18,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        color: widget.isChecked ? kPrimaryColor : kText1Color),
                    borderRadius: BorderRadius.circular(3),
                    color: widget.isChecked? kPrimaryColor : widget.color),
                child: widget.isChecked
                    ? Icon(
                        Icons.check,
                        size: 15,
                        color: kWhite,
                      )
                    : null));
  }
}
