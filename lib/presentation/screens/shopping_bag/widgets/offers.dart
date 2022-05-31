import 'package:flutter/material.dart';
import '../shopping_bag_screen.dart';
import 'my_container.dart';
import 'show_more_btn.dart';
import 'un_order_list_text.dart';

class Offers extends StatelessWidget {
  const Offers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      pVertical: 12,
      pHorizontal: 15,
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.percent_outlined,
                size: 16,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Available Offers',
                style: TextStyleUtils().boldText,
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          UnListText(
              text:
                  '10% Instant Discount on Bank Of Baroda Credit cards on a min spand of Rs 3,000.TCA'),
          ShowMoreBtn()
        ],
      ),
    );
  }
}