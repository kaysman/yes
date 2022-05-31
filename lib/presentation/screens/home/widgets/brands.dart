import 'package:flutter/material.dart';
import 'package:yes/presentation/shared/colors.dart';

class Brands extends StatelessWidget {
  const Brands({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: text1Color,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'MARKALAR',
            style: Theme.of(context)
                .textTheme
                .subtitle2
                ?.copyWith(color: kText1Color),
          ),
          SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(vertical: 15),
              itemCount: bgColors.length,
              itemBuilder: (context, i) {
                return Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: double.infinity,
                  margin: const EdgeInsets.only(right: 15),
                  color: bgColors[i],
                );
                // : Container(
                //     height: double.infinity,
                //     width: MediaQuery.of(context).size.width * 0.45,
                //     decoration: BoxDecoration(
                //       color: primaryColor,
                //       image: DecorationImage(
                //         image: NetworkImage(
                //             brandData.brands?[i].background ?? ''),
                //       ),
                //     ),
                //     child: Column(
                //       children: [
                //         Expanded(
                //           flex: 7,
                //           child:
                //               Stack(alignment: Alignment.center, children: [
                //             Container(
                //               height: double.infinity,
                //               margin: const EdgeInsets.only(right: 15),
                //               width: double.infinity,
                //               child: Image.asset(
                //                 'assets/banner.jpg',
                //                 fit: BoxFit.cover,
                //               ),
                //             ),
                //             Positioned(
                //                 bottom: -15,
                //                 child: Container(
                //                   child: Image.network(
                //                     brandData.brands?[i].logo ?? '',
                //                     height: 30,
                //                   ),
                //                   padding: const EdgeInsets.symmetric(
                //                       vertical: 5, horizontal: 25),
                //                   decoration: BoxDecoration(
                //                       color: whiteColor,
                //                       borderRadius:
                //                           BorderRadius.circular(7)),
                //                 ))
                //           ]),
                //         ),
                //         Container(
                //           child: Text(
                //             brandData.brands?[i].name ?? '',
                //             style: Theme.of(context).textTheme.subtitle1,
                //           ),
                //         )
                //       ],
                //     ),
                //   );
              },
            ),
          )
        ],
      ),
    );
  }
}
