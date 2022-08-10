import 'package:flutter/material.dart';
import 'package:yes/data/models/product%20-new/filter-for-product.model.dart';
import 'package:yes/presentation/screens/home/products/widgets/product_bottom_nav.dart';
import 'package:yes/presentation/screens/home/products/widgets/products-response.dart';
import 'package:yes/presentation/screens/home/widgets/home-app-bar.dart';

class ProductsScreen extends StatefulWidget {
  static const routeName = "products";
  final String? searchValue;
  final String? appBarTitle;
  const ProductsScreen({
    Key? key,
    this.brandId,
    this.categoryId,
    this.promotionId,
    this.budgetId,
    this.searchValue,
    this.appBarTitle,
  }) : super(key: key);

  final int? brandId;
  final int? categoryId;
  final int? promotionId;
  final int? budgetId;

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  String searchVal = '';
  FilterForProductDTO? filter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.searchValue == null
          ? HomeAppBar(
              onSearch: (v) {
                setState(() {
                  searchVal = v;
                });
              },
              isList: true,
              title:
                  widget.appBarTitle != null ? widget.appBarTitle : 'Harytlar',
            )
          : null,
      body: searchVal.isNotEmpty || widget.searchValue?.isNotEmpty == true
          ? ProductsResponse(
              filterVal: filter,
              searchValue:
                  searchVal.isNotEmpty ? searchVal : widget.searchValue,
            )
          : ProductsResponse(
              filterVal: filter,
            ),
      bottomNavigationBar: ProductBootNav(
        onFilterChanged: (v) {
          setState(() {
            filter = v;
          });
        },
      ),
    );
  }
}
