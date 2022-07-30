import 'package:flutter/material.dart';
import 'package:yes/data/models/gadget/gadget.model.dart';
import '../../../shared/colors.dart';

class VipCategories extends StatelessWidget with PreferredSizeWidget {
  VipCategories({
    Key? key,
    required this.gadget,
  }) : super(key: key);

  final GadgetEntity? gadget;
  @override
  Widget build(BuildContext context) {
    var items = gadget?.items;
    return Container(
      height: 80,
      child: ListView.builder(
        padding: const EdgeInsets.only(right: 15, left: 15, bottom: 5),
        scrollDirection: Axis.horizontal,
        itemCount: items?.length ?? bgColors.length,
        itemBuilder: (context, i) {
          var item = items?[i];
          return item == null
              ? CircleAvatar(
                  backgroundColor: bgColors[i],
                )
              : Container(
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: 80,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          item.getFullPathImage!,
                        ),
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 80);
}
