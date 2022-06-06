import 'package:flutter/material.dart';
import 'package:yes/data/models/client/client.model.dart';
import 'package:yes/presentation/shared/colors.dart';

import 'my_container.dart';

class UserAdress extends StatelessWidget {
  final Client? user;
  const UserAdress({
    Key? key,
    required this.user,
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
                        color: kText1Color,
                        fontSize: 12,
                      ),
                      children: [
                        TextSpan(
                          text: '${user?.name}, ${user?.phone}',
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
                  '${user?.address}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: kText1Color,
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
                  color: kPrimaryColor,
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
