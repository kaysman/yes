import 'package:flutter/material.dart';
import 'package:yes/data/models/gadget/gadget.model.dart';
import '../../../shared/colors.dart';

class VipCategories extends StatelessWidget with PreferredSizeWidget {
  VipCategories({
    Key? key,
    required this.gadget,
    required this.isLoading,
  }) : super(key: key);

  final GadgetEntity? gadget;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    var items = gadget?.items;
    return Container(
      height: 80,
      child: ListView.builder(
        padding: isLoading ? const EdgeInsets.only(left: 15, bottom: 10) : null,
        scrollDirection: Axis.horizontal,
        itemCount: items == null ? bgColors.length : items.length,
        itemBuilder: (context, i) {
          var item = items?[i];
          return item == null
              ? Container(
                  margin: const EdgeInsets.only(right: 10),
                  color: bgColors[i],
                  height: 80,
                  width: 80,
                )
              : Container(
                  margin: const EdgeInsets.only(right: 10),
                  color: bgColors[i],
                  child: Image.network(
                    width: MediaQuery.of(context).size.width * 0.2,
                    item.getFullPathImage!,
                    fit: BoxFit.cover,
                  ),
                );
        },
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 80);
}
