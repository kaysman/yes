import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:yes/data/models/product%20-new/filter-for-product.model.dart';
import 'package:yes/presentation/screens/home/products/widgets/product_bottom_nav.dart';
import 'package:yes/presentation/screens/home/products/widgets/products-response.dart';
import 'package:yes/presentation/screens/home/widgets/home-app-bar.dart';

class ProductsScreen extends StatefulWidget {
  static const routeName = "products";

  const ProductsScreen({
    Key? key,
    this.searchValue,
    this.appBarTitle,
    this.link,
    this.filter,
  }) : super(key: key);

  final String? link;
  final String? searchValue;
  final String? appBarTitle;
  final FilterForProductDTO? filter;

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  String searchVal = '';
  FilterForProductDTO? filter;

  @override
  void initState() {
    if (widget.filter != null) {
      filter = widget.filter;
    }
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ProductsScreen oldWidget) {
    if (widget.filter != oldWidget.filter) {
      filter = widget.filter;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  _buildAppBar() {
    return widget.searchValue == null
        ? HomeAppBar(
            onSearch: (v) {
              setState(() {
                searchVal = v;
              });
            },
            title: widget.appBarTitle != null ? widget.appBarTitle : 'Harytlar',
          )
        : null;
  }

  _buildBody() {
    if (searchVal.isNotEmpty || widget.searchValue?.isNotEmpty == true) {
      return ProductsResponse(
        link: widget.link,
        searchValue: searchVal.isNotEmpty ? searchVal : widget.searchValue,
      );
    } else {
      return ProductsResponse(
        link: widget.link,
        filterVal: filter,
      );
    }
  }

  _buildBottomNav() {
    return ProductBootNav(
      onFilterChanged: (v) {
        setState(
          () {
            filter = v;
          },
        );
      },
    );
  }
}
