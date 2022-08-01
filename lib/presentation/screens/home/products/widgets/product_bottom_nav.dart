import 'package:flutter/material.dart';
import 'package:yes/presentation/shared/colors.dart';

import '../filter/filter_screen.dart';

class ProductBootNav extends StatelessWidget {
  // final Filters? filters;
  const ProductBootNav({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
          color: kWhite,
          border: Border(top: BorderSide(width: .5, color: Colors.grey[100]!))),
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
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
                onPressed: () {},
                child: Text(
                  'GENDER',
                  style: TextStyle(
                      color: kText1Color,
                      fontSize: 13,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
            child: VerticalDivider(
              color: Colors.grey[100],
              thickness: 1,
              width: 1,
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              child: TextButton.icon(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
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
                      color: kText1Color,
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
              color: Colors.grey[100],
              thickness: 1,
              width: 1,
            ),
          ),
          Expanded(
            flex: 3,
            child: Stack(children: [
              Container(
                child: TextButton.icon(
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                  onPressed: () {
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (_) {
                    //       return FilterScreen(
                    //         filters: filters,
                    //       );
                    //     },
                    //   ),
                    // );
                  },
                  icon: Icon(
                    Icons.filter_alt,
                    color: Colors.grey,
                    size: 17,
                  ),
                  label: Text(
                    'FILTER',
                    style: TextStyle(
                        color: kText1Color,
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
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ))
            ]),
          )
        ],
      ),
    );
  }
}
