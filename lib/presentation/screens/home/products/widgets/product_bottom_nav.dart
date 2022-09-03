import 'package:flutter/material.dart';
import 'package:yes/data/models/product%20-new/filter-for-product.model.dart';
import 'package:yes/presentation/screens/home/products/filter/filter_screen.dart';
import 'package:yes/presentation/shared/colors.dart';

class ProductBootNav extends StatelessWidget {
  // final Filters? filters;
  final ValueChanged<FilterForProductDTO> onFilterChanged;
  const ProductBootNav({
    Key? key,
    required this.onFilterChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: kWhite,
        border: Border(
          top: BorderSide(width: .5, color: Colors.grey[100]!),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
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
            child: Stack(
              children: [
                Container(
                  child: TextButton.icon(
                    style: ButtonStyle(
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                    ),
                    onPressed: () async {
                      final res = await Navigator.of(context).push(
                        MaterialPageRoute<FilterForProductDTO>(
                          builder: (_) {
                            return FilterScreen();
                          },
                        ),
                      );
                      if (res != null) {
                        onFilterChanged.call(res);
                      }
                      // print('-----------');
                      // print(res);
                      // print('-----------');
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
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
