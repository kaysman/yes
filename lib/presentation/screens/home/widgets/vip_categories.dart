import 'package:flutter/material.dart';

import '../../../shared/colors.dart';

class VipCategories extends StatelessWidget with PreferredSizeWidget {
  // final List<CategoryModel>? category;
  VipCategories({Key? key,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: ListView.builder(
          padding: const EdgeInsets.only(right: 15, left: 15, bottom: 5),
          scrollDirection: Axis.horizontal,
          itemCount: bgColors.length,
          itemBuilder: (context, i) {
            return Container(
              margin: const EdgeInsets.only(right: 10),
              width: MediaQuery.of(context).size.width * 0.2,
              height: 60,
              color: bgColors[i],
            );
            // : Container(
            //     margin: const EdgeInsets.only(right: 10),
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       children: [
            //         Container(
            //           alignment: Alignment.center,
            //           width: MediaQuery.of(context).size.width * 0.2,
            //           height: 60,
            //           decoration: BoxDecoration(
            //               image: DecorationImage(
            //                   image:
            //                       NetworkImage(category?[i].image ?? '')),
            //               shape: BoxShape.circle),
            //         ),
            //         Text(
            //           category?[i].title_tm ?? '',
            //           textAlign: TextAlign.center,
            //           style: TextStyle(
            //               color: text1Color,
            //               fontSize: 10,
            //               fontWeight: FontWeight.w500),
            //         )
            //       ],
            //     ),
            //   );
          }),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(90);
}
