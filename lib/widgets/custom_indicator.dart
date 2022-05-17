import 'package:flutter/material.dart';

class CustomIndicator extends StatelessWidget {
  final bool isActive;
  const CustomIndicator({
    Key? key,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context,) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      width: 5,
      height: 5,
      decoration: BoxDecoration(
          color: isActive ? Colors.pinkAccent : Colors.grey,
          shape: BoxShape.circle),
    );
  }
}
