import 'dart:async';
import 'package:flutter/material.dart';
import 'package:yes/data/models/product%20-new/filter-for-product.model.dart';
import 'package:yes/data/service/products_service.dart';
import 'package:yes/presentation/screens/category/category_screen.dart';
import 'package:yes/presentation/screens/home/products/widgets/emty-search-or-filter.dart';
import 'package:yes/presentation/screens/home/products/widgets/product_list_item.dart';
import 'package:yes/presentation/shared/colors.dart';
import 'package:yes/presentation/shared/components/app-loading-bar.dart';

import '../../../../../data/models/product -new/product.model.dart';

class ProductsResponse extends StatefulWidget {
  ProductsResponse({
    Key? key,
    this.searchValue,
    this.filterVal,
    this.link,
  }) : super(key: key);
  final String? searchValue;
  final String? link;
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
      if (widget.filterVal != null) {
        getAllProducts(
          link: widget.link,
          filter: widget.filterVal,
        );
      } else if (widget.searchValue != null) {
        getAllProducts(
          link: widget.link,
          filter: FilterForProductDTO(
            search: widget.searchValue,
          ),
        );
      } else {
        getAllProducts(
          link: widget.link,
        );
      }
    }
  }

  @override
  void initState() {
    productsSubscription = productsStream.stream.listen((event) {});

    if (widget.searchValue != null) {
      getAllProducts(
          link: widget.link,
          filter: FilterForProductDTO(search: widget.searchValue));
    } else if (widget.link != null) {
      getAllProducts(
        link: widget.link,
      );
    } else if (widget.filterVal != null) {
      getAllProducts(filter: widget.filterVal);
    }

    scrollController = ScrollController();
    scrollController.addListener(scrollListener);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ProductsResponse oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.searchValue != widget.searchValue) {
      if (widget.searchValue != null) {
        if (productList.isNotEmpty) {
          productList = [];
        }
        getAllProducts(
            link: widget.link,
            filter: FilterForProductDTO(search: widget.searchValue));
      }
    } else if (widget.filterVal != oldWidget.filterVal) {
      productList = [];
      getAllProducts(link: widget.link, filter: widget.filterVal);
    }
  }

  getAllProducts({FilterForProductDTO? filter, String? link}) async {
    if (filter == null) {
      filter = FilterForProductDTO();
    }
    changeLoading();
    try {
      if (productList.isNotEmpty) {
        filter.lastId = productList.last.id;
      }
      print(link);
      var res = await ProductsService.getProducts(
        queryParams: filter.toJson(),
        link: link,
      );
      if (res.isNotEmpty) {
        for (var item in res) {
          if (!productList.contains(item)) {
            setState(() {
              productList.add(item);
            });
            productsStream.add(res);
          }
        }
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
          if (snapshot.data?.isEmpty == true && widget.searchValue != null ||
              snapshot.data?.isEmpty == true && widget.filterVal != null) {
            return EmptySearchOrFilterView(
              onTryAgain: () {
                getAllProducts(
                  link: widget.link,
                );
              },
            );
          }

          var products = productList.isEmpty ? snapshot.data : productList;
          return Stack(
            children: [
              GridView.count(
                  controller: scrollController,
                  crossAxisCount: 2,
                  padding: isLoading
                      ? EdgeInsets.only(
                          bottom: 20,
                        )
                      : null,
                  childAspectRatio: 3 / 4.3,
                  children: List.generate(products?.length ?? 0, (index) {
                    var item = products?[index];

                    return ProductsGridItem(
                      item: item,
                    );
                  })),
              if (isLoading)
                Positioned(
                  bottom: -40,
                  left: 0,
                  right: 0,
                  child: Center(child: AppLoadingBar()),
                )
            ],
          );
        } else {
          return AppErrorWidget(onTryAgain: () async {
            await getAllProducts();
          });
        }
      },
    );
  }
}
