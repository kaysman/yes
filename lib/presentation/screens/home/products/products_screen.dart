import 'package:flutter/material.dart';
import 'package:yes/presentation/shared/colors.dart';
import '../../../../data/constants.dart';
import 'widgets/product_bottom_nav.dart';
import 'widgets/product_grid_list.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: kWhite,
          title: Text(
            'Products',
          )),
      body: ProductsGridList(
        products: products,
      ),
      bottomNavigationBar: ProductBootNav(),
    );
  }
}
