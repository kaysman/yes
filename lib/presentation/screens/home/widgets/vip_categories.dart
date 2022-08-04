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
      // padding: const EdgeInsets.symmetric(vertical: 20),
      height: 140,
      child: ListView.builder(
        padding: isLoading
            ? const EdgeInsets.only(
                left: 15,
                bottom: 10,
              )
            : null,
        scrollDirection: Axis.horizontal,
        itemCount: items == null ? bgColors.length : items.length,
        itemBuilder: (context, i) {
          var item = items?[i];
          return item == null
              ? Container(
                  margin: isLoading ? const EdgeInsets.only(right: 10) : null,
                  color: bgColors[i],
                  height: 80,
                  width: 80,
                )
              : Container(
                  margin: isLoading ? const EdgeInsets.only(right: 10) : null,
                  color: bgColors[i],
                  child: Image.network(
                    width: MediaQuery.of(context).size.width * 0.2,
                    item.getFullPathImage!,
                    // fit: BoxFit.cover,
                  ),
                );
        },
      ),
    );
  }

  @override
  Size get preferredSize => Size(
        double.infinity,
        200,
      );
}
