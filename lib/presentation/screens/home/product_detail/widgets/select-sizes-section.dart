import 'package:flutter/material.dart';
import 'package:yes/data/models/product%20-new/size.model.dart';
import 'package:yes/presentation/screens/home/product_detail/widgets/detail-list.dart';
import 'package:yes/presentation/shared/colors.dart';

class SelectSizesSection extends StatelessWidget {
  final List<SizeEntity> sizes;
  final ValueChanged<SizeEntity> onSizeSelected;

  const SelectSizesSection({
    Key? key,
    required this.sizes,
    required this.onSizeSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      // height: 100,
      width: double.infinity,
      color: kWhite,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Select Size',
                style: TextStyle(
                    color: kText1Color,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  'Size chart',
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          SizedBox(
            height: 8,
          ),
          // * sizes here...
          Container(
            width: double.infinity,
            child: Wrap(
              // alignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.start,
              children: sizes
                  .map(
                    (e) => SizeBox(
                      isSelected: false,
                      onSelect: (v) => onSizeSelected.call(v),
                      size: e,
                    ),
                  )
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
