import 'package:flutter/material.dart';
import 'package:yes/presentation/shared/colors.dart';


class CustomRatingBar extends StatelessWidget {
  const CustomRatingBar({
    Key? key,
    required this.rating,
    required this.commentsCount,
  }) : super(key: key);

  final double? rating;
  final int? commentsCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65,
      decoration: BoxDecoration(
        color: Colors.white70,
        border: Border.all(width: 1, color: Colors.white60),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                "${rating}",
                style: TextStyle(
                    fontSize: 12,
                    color: kText1Color,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 2,
              ),
              Icon(
                Icons.star,
                size: 10,
                color: Color.fromARGB(255, 23, 119, 95),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                  height: 15,
                  child: VerticalDivider(
                    color: Colors.black12,
                    width: 2,
                    thickness: 0.6,
                  )),
              SizedBox(
                width: 4,
              ),
              if (commentsCount != null)
                Text(
                  '${commentsCount}',
                  style: TextStyle(
                    fontSize: 12,
                    color: kText1Color,
                    fontWeight: FontWeight.bold,
                  ),
                )
            ],
          )
        ],
      ),
    );
  }
}
