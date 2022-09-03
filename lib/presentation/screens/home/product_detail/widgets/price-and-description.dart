import 'package:flutter/material.dart';
import 'package:yes/presentation/shared/colors.dart';

class ProductPriceAndDescription extends StatelessWidget {
  const ProductPriceAndDescription({
    Key? key,
    required this.name,
    required this.description,
    required this.ourPrice,
    required this.brand,
  }) : super(key: key);

  final String name;
  final String brand;
  final String description;
  final int ourPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(bottom: 5, left: 15, right: 15),
      color: kWhite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
              text: '${brand}  ',
              style: TextStyle(
                fontSize: 15,
                color: kText1Color,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: name,
                  style: TextStyle(fontWeight: FontWeight.normal),
                )
              ],
            ),
          ),
          Text(
            description,
            style: TextStyle(fontSize: 15),
          ),
          SizedBox(
            height: 8,
          ),
          Text.rich(
            TextSpan(
              text: "${ourPrice} TMT",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ],
      ),
    );
  }
}
