import 'package:flutter/material.dart';

class PhoneFieldPrefix extends StatelessWidget {
  const PhoneFieldPrefix({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 12),
          Text(
            '+993',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(width: 5),
          SizedBox(
            height: 48,
            child: VerticalDivider(
              indent: 10,
              endIndent: 10,
              width: 1,
              thickness: 0.6,
              color: Colors.grey[100],
            ),
          ),
        ],
      ),
    );
  }
}
