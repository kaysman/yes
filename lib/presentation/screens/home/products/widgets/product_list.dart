import 'package:flutter/material.dart';
import 'package:yes/data/models/product%20-new/product.model.dart';
import 'package:yes/presentation/screens/home/products/widgets/product_list_item.dart';
import 'package:yes/presentation/shared/colors.dart';

class ProductsGridList extends StatelessWidget {
  final ScrollController scrollController;
  final List<ProductEntity>? products;
  const ProductsGridList(
      {Key? key, this.products, required this.scrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      controller: scrollController,
      crossAxisCount: 2,
      childAspectRatio: 1 / 2,
      children: List.generate(
        products?.length ?? bgColors.length,
        (index) => ProductsGridItem(
          bgColor: bgColors[index],
          item: products?[index],
        ),
      ),
    );
  }
}
