import 'package:flutter/material.dart';

import '../../../data/db.dart';
import '../../product_detail/product_detail_screen.dart';
import '../../products/products_screen.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/banner.jpg'), fit: BoxFit.cover)),
      child: Row(
        children: [
          InkWell(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                return ProductsScreen();
              }),
            ),
            child: Container(
              width: MediaQuery.of(context).size.width / 2,
              // color: primaryColor,
            ),
          ),
          InkWell(
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) {
              return ProductDetailScreen(
                product: DataBase.products[0],
              );
            })),
            child: Container(
              width: MediaQuery.of(context).size.width / 2,
              // color: text1Color,
            ),
          )
        ],
      ),
    );
  }
}
