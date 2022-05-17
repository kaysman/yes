import 'package:flutter/material.dart';
import 'package:yes_demo/helpers/colors.dart';

import 'my_container.dart';

class UserAdress extends StatelessWidget {
  const UserAdress({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      pVertical: 5,
      pHorizontal: 15,
      widget: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                      text: 'Deliver to: ',
                      style: TextStyle(
                        color: text1Color,
                        fontSize: 12,
                      ),
                      children: [
                        TextSpan(
                          text: 'Daniyar, 560043',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ]),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  '10,Apex Pearl,Horomavu Main Road, Banaswa street',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: text1Color,
                    fontSize: 12,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: TextButton(
              onPressed: () {},
              child: Text(
                'CHANGE',
                style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 11,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
