import 'package:flutter/material.dart';
import 'package:yes/data/models/product%20-new/size.model.dart';
import 'package:yes/presentation/shared/colors.dart';

class DetailsList extends StatelessWidget {
  final String text;
  const DetailsList({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 2),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(2),
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: kText1Color),
          ),
          SizedBox(
            width: 7,
          ),
          Text(
            text,
            style: TextStyle(
              color: kText1Color,
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}

class RowText extends StatelessWidget {
  final String topT;
  final String botT;
  const RowText({Key? key, required this.topT, required this.botT})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            topT,
            style: TextStyle(
                color: kText1Color, fontSize: 12, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            botT,
            style: TextStyle(
              color: kText1Color,
              fontSize: 12,
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Divider(height: .5, color: Colors.black26, thickness: .5)
        ],
      ),
    );
  }
}

class SizeBox extends StatelessWidget {
  final SizeEntity size;
  final bool isSelected;
  final bool isHas;
  final ValueChanged<SizeEntity> onSelect;
  SizeBox(
      {Key? key,
      required this.size,
      required this.isSelected,
      required this.onSelect,
      required this.isHas})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print('---is selected---');
    // print(size);
    // print('---is selected---');
    return InkWell(
      onTap: () => isHas ? null : onSelect.call(size),
      child: Container(
        width: 45,
        height: 45,
        padding: const EdgeInsets.all(5),
        alignment: Alignment.center,
        margin: const EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
          color: isSelected
              ? kPrimaryColor
              : isHas
                  ? kPrimaryColor.withOpacity(.3)
                  : null,
          border: Border.all(
            width: 1,
            color: kText1Color,
          ),
          shape: BoxShape.circle,
        ),
        child: Text(
          size.name_tm ?? '-',
          style: TextStyle(
            color: isSelected || isHas ? kWhite : kText1Color,
            fontSize: 11,
          ),
        ),
      ),
    );
  }
}
