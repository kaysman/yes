import 'dart:async';

import 'package:flutter/material.dart';
import 'package:yes/data/models/product%20-new/filter-for-product.model.dart';
import 'package:yes/data/models/product%20-new/product.model.dart';
import 'package:yes/data/service/products_service.dart';
import 'package:yes/presentation/screens/home/products/widgets/product_bottom_nav.dart';
import 'package:yes/presentation/screens/home/products/widgets/product_list_item.dart';
import 'package:yes/presentation/shared/colors.dart';
import 'package:yes/presentation/shared/components/app-loading-bar.dart';

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
  late ScrollController scrollController;
  List<ProductEntity> productList = [];
  bool isLoading = false;

  var productsStream = StreamController<List<ProductEntity>>.broadcast();
  late StreamSubscription<List<ProductEntity>> productsSubscription;

  scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      getAllProducts();
    }
  }

  @override
  void initState() {
    productsSubscription = productsStream.stream.listen((event) {
      productList.addAll(event);
    });
    getAllProducts();

    scrollController = ScrollController();
    scrollController.addListener(scrollListener);
    super.initState();
  }

  getAllProducts({FilterForProductDTO? filter}) async {
    if (filter == null) {
      filter = FilterForProductDTO();
    }
    changeLoading();
    try {
      if (productList.isNotEmpty) {
        filter.lastId = productList.last.id;
      }
      var res = await ProductsService.getProducts(queryParams: filter.toJson());
      if (res.length == 1) {
        changeLoading();
        return;
      } else if (res.isNotEmpty && res.length > 1) {
        productsStream.add(res);
        setState(() {
          productList.addAll(res);
        });
      }
      changeLoading();
    } catch (_) {
      print(_);
    }
  }

  changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  void dispose() {
    productsStream.close();
    productsSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: kWhite,
          title: Text(
            'Harytlar',
          )),
      body: StreamBuilder<List<ProductEntity>>(
        stream: productsStream.stream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return AppLoadingBar();
          } else if (snapshot.hasData) {
            var products = productList.isEmpty ? snapshot.data : productList;
            return Column(
              children: [
                Expanded(
                  child: GridView.count(
                    controller: scrollController,
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 4.3,
                    children: products
                            ?.map(
                              (e) => ProductsGridItem(
                                item: e,
                              ),
                            )
                            .toList() ??
                        [],
                  ),
                ),
                if (isLoading && (snapshot.data?.length ?? 0) > 1)
                  Container(
                    margin: const EdgeInsets.only(top: 14),
                    child: AppLoadingBar(),
                  ),
              ],
            );
          } else {
            return Center(
                child: Text(
              'Something went wrong',
              style: TextStyle(color: kPrimaryColor),
            ));
          }
        },
      ),
      bottomNavigationBar: ProductBootNav(),
    );
  }
}
