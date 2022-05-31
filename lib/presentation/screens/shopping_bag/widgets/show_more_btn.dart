import 'package:flutter/material.dart';
import 'package:yes/presentation/shared/colors.dart';

import 'un_order_list_text.dart';


class ShowMoreBtn extends StatefulWidget {
  const ShowMoreBtn({Key? key}) : super(key: key);

  @override
  State<ShowMoreBtn> createState() => _ShowMoreBtnState();
}

class _ShowMoreBtnState extends State<ShowMoreBtn> {
  bool isShow = true;

  List<UnListText> texts = [
    UnListText(
        text:
            '10% Instant Discount on Bank Of Baroda Credit cards on a min spand of Rs 3,000.TCA'),
    UnListText(
        text:
            '10% Instant Discount on Bank Of Baroda Credit cards on a min spand of Rs 3,000.TCA'),
    UnListText(
        text:
            '10% Instant Discount on Bank Of Baroda Credit cards on a min spand of Rs 3,000.TCA'),
    UnListText(
        text:
            '10% Instant Discount on Bank Of Baroda Credit cards on a min spand of Rs 3,000.TCA'),
  ];

  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Column(
            children: List.generate(current, (index) => texts[index]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(
                flex: 1,
              ),
              Expanded(
                flex: 7,
                child: Container(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isShow) {
                          current = texts.length;
                        } else {
                          current = 0;
                        }
                        isShow = !isShow;
                      });
                    },
                    child: Row(
                      children: [
                        Text(
                          isShow ? 'Show More' : 'Show Less',
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                        Icon(
                          isShow
                              ? Icons.keyboard_arrow_down_outlined
                              : Icons.keyboard_arrow_up,
                          size: 15,
                          color: kPrimaryColor,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Spacer(
                flex: 14,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
