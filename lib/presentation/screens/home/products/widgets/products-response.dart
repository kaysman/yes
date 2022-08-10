import 'dart:async';

import 'package:flutter/material.dart';
import 'package:yes/data/models/product%20-new/filter-for-product.model.dart';
import 'package:yes/data/service/products_service.dart';
import 'package:yes/presentation/screens/home/products/widgets/product_list_item.dart';
import 'package:yes/presentation/shared/colors.dart';
import 'package:yes/presentation/shared/components/app-loading-bar.dart';
import 'package:yes/presentation/shared/components/button.dart';

import '../../../../../data/models/product -new/product.model.dart';

class ProductsResponse extends StatefulWidget {
  ProductsResponse({
    Key? key,
    this.searchValue,
    this.filterVal,
  }) : super(key: key);
  final String? searchValue;
  final FilterForProductDTO? filterVal;

  @override
  State<ProductsResponse> createState() => _ProductsResponseState();
}

class _ProductsResponseState extends State<ProductsResponse> {
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
    print('=============');
    productsSubscription = productsStream.stream.listen((event) {
      productList.addAll(event);
    });
    if (widget.searchValue != null) {
      getAllProducts(filter: FilterForProductDTO(search: widget.searchValue));
    } else {
      getAllProducts();
    }

    scrollController = ScrollController();
    scrollController.addListener(scrollListener);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ProductsResponse oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (productList.isNotEmpty) {
      productList = [];
    }
    if (oldWidget.filterVal?.color_id != widget.filterVal?.color_id) {
      getAllProducts(
        filter: widget.filterVal,
      );
    }
    // print(widget.filterVal);
    // print('1111111111111111111111');
    // if (oldWidget.searchValue != widget.searchValue) {
    //   if (widget.searchValue != null) {
    //     getAllProducts(filter: FilterForProductDTO(search: widget.searchValue));
    //     if (productList.isNotEmpty) {
    //       productList = [];
    //     }
    //   }
    // }
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
      if (widget.searchValue == null && res.length == 1) {
        changeLoading();
        return;
      } else if (res.isNotEmpty && res.length > 1 ||
          widget.searchValue != null) {
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
    return StreamBuilder<List<ProductEntity>>(
      stream: productsStream.stream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return AppLoadingBar();
        } else if (snapshot.hasData) {
          var products = productList.isEmpty ? snapshot.data : productList;

          if (snapshot.data?.isEmpty == true && widget.searchValue != null) {
            return Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 14,
                  ),
                  Image.asset(
                    'assets/res.png',
                    width: MediaQuery.of(context).size.width * .85,
                    height: MediaQuery.of(context).size.height * .2,
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text('Siziň gözlegiňize degişli haryt tapylmady!'),
                  SizedBox(
                    height: 14,
                  ),
                  Button(
                    text: 'Gaýtadan synanyşyň',
                    onPressed: () {
                      getAllProducts();
                    },
                    hasBorder: true,
                  )
                ],
              ),
            );
          }

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
    );
  }
}
