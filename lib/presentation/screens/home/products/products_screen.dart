import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yes/data/models/product/product.model.dart';
import 'package:yes/data/service/promtion_service.dart';
import 'package:yes/presentation/screens/home/home_bloc.dart';
import 'package:yes/presentation/shared/colors.dart';
import 'widgets/product_bottom_nav.dart';
import 'widgets/product_grid_list.dart';

class ProductsScreen extends StatefulWidget {
  static const routeName = "products";
  const ProductsScreen({
    Key? key,
    this.brandId,
    this.categoryId,
    this.promotionId,
    this.budgetId,
  }) : super(key: key);

  final int? brandId;
  final int? categoryId;
  final int? promotionId;
  final int? budgetId;

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  late Future<List<Product>> fetchProducts;

  @override
  void initState() {
    if (widget.promotionId != null) {
      fetchProducts =
          PromotionService.fetchPromotionProducts(widget.promotionId);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: kWhite,
          title: Text(
            'Products',
          )),
      body: FutureBuilder<List<Product>>(
        future: fetchProducts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // loading widget here
            return SizedBox();
          } else if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return ProductsGridList(products: snapshot.data);
          } else {
            // error placeholder here
            return SizedBox();
          }
        },
      ),
      bottomNavigationBar: ProductBootNav(),
    );
  }
}
