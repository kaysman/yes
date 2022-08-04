import 'package:flutter/material.dart';
import 'package:yes/presentation/screens/home/product_detail/widgets/detail-list.dart';
import 'package:yes/presentation/shared/colors.dart';

class Fitsection extends StatelessWidget {
  const Fitsection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: kWhite,
      padding:
          const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RowText(
                    botT: 'Regular Fit',
                    topT: 'Fit',
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  RowText(
                    botT: 'Regular Fit',
                    topT: 'Fit',
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  RowText(
                    botT: 'Regular Fit',
                    topT: 'Fit',
                  ),
                  RowText(
                    botT: 'Regular Fit',
                    topT: 'Fit',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Product Details',
                    style: TextStyle(
                        color: kText1Color,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Column(
                    children: [
                      DetailsList(text: 'Green Tshirt for men'),
                      DetailsList(text: 'Solid'),
                      DetailsList(text: 'Polo collar'),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
                child: Container(
              child: Column(
                children: [
                  RowText(
                    botT: 'Typography or Slogan Print',
                    topT: 'Main Trend',
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  RowText(
                    botT: 'Regular Fit',
                    topT: 'Fit',
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  RowText(
                    botT: 'Regular Fit',
                    topT: 'Fit',
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            )),
          ]),
    );
  }
}