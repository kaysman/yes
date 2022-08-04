import 'package:flutter/material.dart';
import 'package:yes/presentation/shared/colors.dart';

class QualitySection extends StatelessWidget {
  const QualitySection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      width: double.infinity,
      color: kWhite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.generating_tokens_outlined,
                    color: kPrimaryColor,
                  ),
                  Text(
                    'Geniune Product',
                    style: TextStyle(color: kPrimaryColor, fontSize: 12),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 25,
            child:
                VerticalDivider(thickness: .5, width: 2, color: Colors.black26),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.generating_tokens_outlined,
                    color: kPrimaryColor,
                  ),
                  Text(
                    'Geniune Product',
                    style: TextStyle(color: kPrimaryColor, fontSize: 12),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}