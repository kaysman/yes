import 'package:flutter/material.dart';

class AppBarIconBtn extends StatelessWidget {
  final IconData icon;
  final Function() onPressed;
  const AppBarIconBtn({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: IconButton(
          icon: Icon(
            icon,
            size: 23,
            color: Colors.black87,
          ),
          onPressed: onPressed),
      decoration: BoxDecoration(color: Colors.white70, shape: BoxShape.circle),
    );
  }
}
