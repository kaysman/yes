import 'package:flutter/material.dart';
import 'package:yes/data/models/product/product.model.dart';
import 'package:yes/data/models/product_model.dart';
import 'package:yes/presentation/screens/home/products/widgets/product_grid_item.dart';

class ProductsGridList extends StatelessWidget {
  final List<Product>? products;
  const ProductsGridList({Key? key, this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 1 / 2,
      children: [],
      // products
      //     .map(
      //       (e) => ProductsGridItem(
      //         product: e,
      //       ),
      //     )
      //     .toList(),
    );
  }
}
