import 'package:flutter/material.dart';
import 'package:yes_demo/helpers/colors.dart';
import 'package:yes_demo/models/product_model.dart';

import '../../data/db.dart';
import 'widgets/product_bottom_nav.dart';
import 'widgets/product_grid_list.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: whiteColor,
          title: Text(
            'Products',
          )),
      body: ProductsGridList(
        products: DataBase.products,
      ),
      bottomNavigationBar: ProductBootNav(),
    );
  }
}
