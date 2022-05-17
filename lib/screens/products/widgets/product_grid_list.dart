import 'package:flutter/material.dart';
import 'package:yes_demo/screens/products/widgets/product_grid_item.dart';

import '../../../models/product_model.dart';
import '../products_screen.dart';

class ProductsGridList extends StatelessWidget {
  final List<ProductsModel> products;
  const ProductsGridList({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 1 / 2,
      children: products
          .map(
            (e) => ProductsGridItem(
              product: e,
            ),
          )
          .toList(),
    );
  }
}
