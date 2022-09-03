import 'package:flutter/material.dart';

class AppBarIconBtn extends StatelessWidget {
  final Widget iconButton;
  const AppBarIconBtn({
    Key? key,
    required this.iconButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: iconButton,
      decoration: BoxDecoration(color: Colors.white70, shape: BoxShape.circle),
    );
  }
}
