import 'package:flutter/material.dart';

import '../../../helpers/colors.dart';

class ProductBootNav extends StatelessWidget {
  const ProductBootNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
          color: whiteColor,
          border: Border(top: BorderSide(width: .5, color: grey2!))),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {},
                child: Text('GENDER',
                    style: TextStyle(
                        color: text1Color,
                        fontSize: 13,
                        fontWeight: FontWeight.w500)),
              ),
            ),
          ),
          SizedBox(
            height: 15,
            child: VerticalDivider(
              color: grey2,
              thickness: 1,
              width: 1,
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              child: TextButton.icon(
                onPressed: () {
                  print('object');
                },
                icon: Icon(
                  Icons.sort,
                  color: Colors.grey,
                  size: 17,
                ),
                label: Text(
                  'SORT',
                  style: TextStyle(
                      color: text1Color,
                      fontSize: 13,
                      fontWeight: FontWeight.w500),
                ),
              ),
              alignment: Alignment.center,
            ),
          ),
          SizedBox(
            height: 15,
            child: VerticalDivider(
              color: grey2,
              thickness: 1,
              width: 1,
            ),
          ),
          Expanded(
            flex: 3,
            child: Stack(children: [
              Container(
                child: TextButton.icon(
                  onPressed: () {
                    print('object');
                  },
                  icon: Icon(
                    Icons.filter_alt,
                    color: Colors.grey,
                    size: 17,
                  ),
                  label: Text(
                    'FILTER',
                    style: TextStyle(
                        color: text1Color,
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                alignment: Alignment.center,
              ),
              Positioned(
                  top: 6,
                  right: 13,
                  child: Container(
                    width: 5,
                    height: 5,
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(5)),
                  ))
            ]),
          )
        ],
      ),
    );
  }
}
