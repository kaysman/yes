import 'package:flutter/material.dart';

import '../cart_screen.dart';

class UnListText extends StatelessWidget {
  final String text;
  const UnListText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.topLeft,
              child: Container(
                margin: const EdgeInsets.only(top: 5),
                width: 5,
                height: 5,
                decoration: BoxDecoration(
                    color: Colors.black26, shape: BoxShape.circle),
              ),
            ),
          ),
          Expanded(
            flex: 20,
            child: Text(
              text,
              style: TextStyleUtils().thinText,
            ),
          ),
        ],
      ),
    );
  }
}
