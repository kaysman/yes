import 'package:flutter/material.dart';
import 'package:yes/data/models/product/filters.model.dart';
import 'package:yes/data/models/product/products.model.dart';
import 'package:yes/data/service/promtion_service.dart';
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
  final ScrollController _scrollController = ScrollController();
  late Future<Products> fetchProducts;
  Filters? filters;

  @override
  void initState() {
    if (widget.promotionId != null) {
      print(widget.promotionId);
      fetchProducts =
          PromotionService.fetchPromotionProducts(widget.promotionId);
    }
    // _scrollController.;
    fetchFilters();
    super.initState();
  }

  Future<Filters?> fetchFilters() async {
    await fetchProducts.then((value) {
      setState(() {
        filters = value.filters;
      });
    });
    return filters;
  }

  @override
  Widget build(BuildContext context) {
    print(filters);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: kWhite,
          title: Text(
            'Products',
          )),
      body: FutureBuilder<Products>(
        future: fetchProducts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: kPrimaryColor,
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return ProductsGridList(
                scrollController: _scrollController,
                products: snapshot.data?.products ?? []);
          } else {
            return Center(
                child: Text(
              'Something went wrong',
              style: TextStyle(color: kPrimaryColor),
            ));
          }
        },
      ),
      bottomNavigationBar: ProductBootNav(
        filters: filters,
      ),
    );
  }
}
