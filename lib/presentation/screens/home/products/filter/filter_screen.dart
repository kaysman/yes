import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yes/data/models/filter/filter.enum.dart';
import 'package:yes/data/models/product%20-new/filter-for-product.model.dart';
import 'package:yes/presentation/screens/category/category.bloc.dart';
import 'package:yes/presentation/screens/home/products/blocs/brand.bloc.dart';
import 'package:yes/presentation/screens/home/products/blocs/category.bloc.dart';
import 'package:yes/presentation/screens/home/products/blocs/filter.bloc.dart';
import 'package:yes/presentation/screens/home/products/blocs/market.bloc.dart';
import 'package:yes/presentation/shared/colors.dart';
import 'package:yes/presentation/shared/components/buttons.dart';
import 'package:yes/presentation/shared/components/input_fields.dart';

class FilterScreen extends StatefulWidget {
  FilterScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  int selectedIndex = 0;
  int? selectedBrandId;
  int? selectedCategoryId;
  int? selectedGenderId;
  int? selectedSizeId;
  int? selectedmarketId;
  int? selectedColorId;
  int? quantity;

  List<Map<String, dynamic>> quantyties = [
    {"from": 0, "to": 10},
    {"from": 10, "to": 20},
    {"from": 20, "to": 30},
    {"from": 30, "to": 40},
    {"from": 40, "to": 50},
    {"from": 50, "to": 60},
    {"from": 60, "to": 70},
  ];

  late BrandBloc brandBloc;
  late CategoryBloc categoryBloc;
  late MarketBloc marketBloc;
  late FilterBloc filterBloc;
  TextEditingController priceFromController = TextEditingController();
  TextEditingController priceTController = TextEditingController();

  @override
  void initState() {
    brandBloc = context.read<BrandBloc>();
    if (brandBloc.state.brands == null) {
      brandBloc.getAllBrands();
    }
    categoryBloc = context.read<CategoryBloc>();
    if (brandBloc.state.brands == null) {
      categoryBloc.getAllCategories();
    }

    marketBloc = context.read<MarketBloc>();
    if (brandBloc.state.brands == null) {
      marketBloc.getAllMarkets();
    }

    filterBloc = context.read<FilterBloc>();
    if (brandBloc.state.brands == null) {
      filterBloc.getAllFilters();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 50,
        color: kSecondaryColor,
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                splashColor: kPrimaryColor,
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Center(
                  child: Text('Close'),
                ),
              ),
            ),
            VerticalDivider(
              color: kText1Color,
              width: .5,
              thickness: .5,
              indent: 10,
              endIndent: 10,
            ),
            Expanded(
              child: Center(
                child: TextButton(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Apply',
                        style: TextStyle(color: kPrimaryColor),
                      ),
                      // if (state.listingStatus ==
                      //     ProductListStatus.silentLoading)
                      // Row(
                      //   mainAxisSize: MainAxisSize.min,
                      //   children: [
                      //     SizedBox(
                      //       width: 15,
                      //     ),
                      //     SizedBox(
                      //       width: 16,
                      //       height: 16,
                      //       child: Center(
                      //         child: CircularProgressIndicator(
                      //           color: kPrimaryColor,
                      //           strokeWidth: 2,
                      //         ),
                      //       ),
                      //     )
                      //   ],
                      // ),
                    ],
                  ),
                  onPressed: () {
                    FilterForProductDTO data = FilterForProductDTO(
                      brand_id: selectedBrandId,
                      category_id: selectedCategoryId,
                      color_id: selectedColorId,
                      gender_id: selectedGenderId,
                      market_id: selectedmarketId,
                      priceFrom: int.tryParse(priceFromController.text),
                      priceTo: int.tryParse(priceTController.text),
                      quantity: quantity,
                      size_id: selectedSizeId,
                    );
                    Navigator.of(context).pop<FilterForProductDTO>(data);
                    // await productBloc.getAllProducts(
                    //   filter: data,
                    //   subtle: true,
                    // );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0.5,
        centerTitle: false,
        title: Text(
          'Filter',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                'refresh all',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: kPrimaryColor),
              ))
        ],
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LayoutBuilder(builder: (context, constraint) {
                    return SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints:
                            BoxConstraints(minHeight: constraint.maxHeight),
                        child: IntrinsicHeight(
                          child: NavigationRail(
                            leading: null,
                            minWidth: 100,
                            backgroundColor: kScaffoldBgColor,
                            onDestinationSelected: (val) => setState(() {
                              selectedIndex = val;
                            }),
                            destinations: [
                              filterSideBarMenuItem(
                                'Brands',
                                selectedItem: selectedBrandId,
                              ),
                              filterSideBarMenuItem(
                                'Categories',
                                selectedItem: selectedCategoryId,
                              ),
                              filterSideBarMenuItem(
                                'Markets',
                                selectedItem: selectedmarketId,
                              ),
                              filterSideBarMenuItem(
                                'Price',
                                selectedItem: priceFromController,
                              ),
                              filterSideBarMenuItem(
                                'Quantity',
                                selectedItem: quantity,
                              ),
                              filterSideBarMenuItem(
                                'Colors',
                                selectedItem: selectedColorId,
                              ),
                              filterSideBarMenuItem(
                                'Sizes',
                                selectedItem: selectedSizeId,
                              ),
                              filterSideBarMenuItem(
                                'Genders',
                                selectedItem: selectedGenderId,
                              ),
                            ],
                            selectedIndex: selectedIndex,
                          ),
                        ),
                      ),
                    );
                  }),
                  Expanded(
                    child: buildBody(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  NavigationRailDestination filterSideBarMenuItem(
    String title, {
    selectedItem,
  }) {
    return NavigationRailDestination(
      selectedIcon: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: double.infinity,
        color: kWhite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title),
            SizedBox(
              height: 10,
            ),
            Button(
              onPressed: () {
                setState(
                  () {
                    if (selectedItem == selectedBrandId) {
                      selectedBrandId = null;
                    } else if (selectedItem == selectedCategoryId) {
                      selectedCategoryId = null;
                    } else if (selectedItem == selectedGenderId) {
                      selectedGenderId = null;
                    } else if (selectedItem == selectedSizeId) {
                      selectedSizeId = null;
                    } else if (selectedItem == selectedmarketId) {
                      selectedmarketId = null;
                    } else if (selectedItem == selectedColorId) {
                      selectedColorId = null;
                    } else if (selectedItem == priceFromController ||
                        selectedItem == priceTController) {
                      priceFromController.text = '';
                      priceTController.text = '';
                    } else if (selectedItem == quantity) {
                      quantity = null;
                    }
                  },
                );
              },
              text: 'Arassala',
              padding: EdgeInsets.zero,
              hasBorder: true,
            ),
          ],
        ),
      ),
      icon: Text(title),
      label: SizedBox(),
    );
  }

  Widget buildBody() {
    switch (selectedIndex) {
      case 0:
        return brandFilterList();
      case 1:
        return categoryFilterList();
      case 2:
        return marketFilterList();
      case 3:
        return priceRangeFilterList();
      case 4:
        return quantityFilterList();
      case 5:
        return colorFilterList();
      case 6:
        return sizeFilterList();
      case 7:
        return genderFilterList();
      default:
        return SizedBox();
    }
  }

  BlocBuilder<MarketBloc, MarketState> marketFilterList() {
    return BlocBuilder<MarketBloc, MarketState>(
        bloc: marketBloc,
        builder: (context, marketState) {
          if (marketState.listingStatus == MarketListStatus.loading) {
            return Container(
              color: kWhite,
              height: double.infinity,
              child: Center(
                child: CircularProgressIndicator(
                  color: kPrimaryColor,
                ),
              ),
            );
          }
          if (marketState.listingStatus == MarketListStatus.error) {
            return Container(
              color: kWhite,
              height: double.infinity,
              child: Center(
                child: Text(
                    'Failed to fetcing orders, please check your Internet Connection and Try again!'),
              ),
            );
          }
          return Container(
            color: kWhite,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: marketState.markets?.map((e) {
                      return Column(
                        children: [
                          Card(
                            child: ListTile(
                              onTap: () => setState(() {
                                selectedmarketId = e.id;
                              }),
                              leading: Icon(
                                Icons.check,
                                color: e.id == selectedmarketId
                                    ? kPrimaryColor
                                    : kScaffoldBgColor,
                              ),
                              title: Text(
                                '${e.title}',
                                style: TextStyle(color: kText2Color),
                              ),
                            ),
                          ),
                        ],
                      );
                    }).toList() ??
                    [],
              ),
            ),
          );
        });
  }

  BlocBuilder<CategoryBloc, CategoryState> categoryFilterList() {
    return BlocBuilder<CategoryBloc, CategoryState>(
        bloc: categoryBloc,
        builder: (context, categoryState) {
          return categoryState.listingStatus == CategoryListStatus.loading
              ? Container(
                  color: kWhite,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: kPrimaryColor,
                    ),
                  ),
                )
              : Container(
                  color: kWhite,
                  height: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                        children: categoryState.categories?.map((e) {
                              return Card(
                                child: ListTile(
                                  onTap: () => setState(() {
                                    selectedCategoryId = e.id;
                                  }),
                                  leading: Icon(
                                    Icons.check,
                                    color: selectedCategoryId == e.id
                                        ? kPrimaryColor
                                        : kScaffoldBgColor,
                                  ),
                                  title: Text(
                                    '${e.title_tm}',
                                    style: TextStyle(color: kText2Color),
                                  ),
                                ),
                              );
                            }).toList() ??
                            []),
                  ),
                );
        });
  }

  BlocBuilder brandFilterList() {
    return BlocBuilder<BrandBloc, BrandState>(
      bloc: brandBloc,
      builder: (context, brnadState) {
        return brnadState.listingStatus == BrandListStatus.loading
            ? Container(
                color: kWhite,
                child: Center(
                  child: CircularProgressIndicator(
                    color: kPrimaryColor,
                  ),
                ),
              )
            : Container(
                color: kWhite,
                height: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    children: brnadState.brands?.map(
                          (e) {
                            return Column(
                              children: [
                                Card(
                                  child: ListTile(
                                    onTap: () => setState(() {
                                      selectedBrandId = e.id;
                                    }),
                                    leading: Icon(
                                      Icons.check,
                                      color: selectedBrandId == e.id
                                          ? kPrimaryColor
                                          : kScaffoldBgColor,
                                    ),
                                    title: Text(
                                      '${e.name}',
                                      style: TextStyle(color: kText2Color),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ).toList() ??
                        [],
                  ),
                ),
              );
      },
    );
  }

  Container priceRangeFilterList() {
    return Container(
      color: kWhite,
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
      child: Column(
        children: [
          LabeledInput(
            editMode: true,
            controller: priceFromController,
            label: 'From',
          ),
          SizedBox(height: 20),
          LabeledInput(
            editMode: true,
            controller: priceTController,
            label: 'TO',
          ),
        ],
      ),
    );
  }

  Container quantityFilterList() {
    return Container(
      color: kWhite,
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
      child: Column(
        children: quantyties
            .map((e) => Card(
                  child: ListTile(
                    onTap: () => setState(() {
                      quantity = e['to'];
                    }),
                    leading: Icon(
                      Icons.check,
                      color: quantity == e['to']
                          ? kPrimaryColor
                          : kScaffoldBgColor,
                    ),
                    title: Row(
                      children: [
                        Text('${e['from']}'),
                        SizedBox(
                          width: 30,
                          child: Divider(
                            endIndent: 10,
                            indent: 10,
                            height: 1,
                            color: kPrimaryColor,
                            thickness: 1,
                          ),
                        ),
                        Text('${e['to']}'),
                      ],
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }

  BlocBuilder<FilterBloc, FilterState> colorFilterList() {
    return BlocBuilder<FilterBloc, FilterState>(
        bloc: filterBloc,
        builder: (context, filterState) {
          var colors = filterState.filters
              ?.where((element) => element.type == FilterType.COLOR);
          return filterState.listingStatus == FilterListStatus.loading
              ? Container(
                  color: kWhite,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: kPrimaryColor,
                    ),
                  ),
                )
              : Container(
                  color: kWhite,
                  height: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                        children: colors?.map((e) {
                              return Column(
                                children: [
                                  Card(
                                    child: ListTile(
                                      onTap: () => setState(() {
                                        selectedColorId = e.id;
                                      }),
                                      leading: Icon(
                                        Icons.check,
                                        color: selectedColorId == e.id
                                            ? kPrimaryColor
                                            : kScaffoldBgColor,
                                      ),
                                      title: Text(
                                        '${e.name_tm}',
                                        style: TextStyle(color: kText2Color),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }).toList() ??
                            []),
                  ),
                );
        });
  }

  BlocBuilder<FilterBloc, FilterState> sizeFilterList() {
    return BlocBuilder<FilterBloc, FilterState>(
        bloc: filterBloc,
        builder: (context, filterState) {
          var sizes = filterState.filters
              ?.where((element) => element.type == FilterType.SIZE);
          return filterState.listingStatus == FilterListStatus.loading
              ? Container(
                  color: kWhite,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: kPrimaryColor,
                    ),
                  ),
                )
              : Container(
                  color: kWhite,
                  height: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                        children: sizes?.map((e) {
                              return Column(
                                children: [
                                  Card(
                                    child: ListTile(
                                      onTap: () => setState(() {
                                        selectedSizeId = e.id;
                                      }),
                                      leading: Icon(
                                        Icons.check,
                                        color: selectedSizeId == e.id
                                            ? kPrimaryColor
                                            : kScaffoldBgColor,
                                      ),
                                      title: Text(
                                        '${e.name_tm}',
                                        style: TextStyle(color: kText2Color),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }).toList() ??
                            []),
                  ),
                );
        });
  }

  BlocBuilder<FilterBloc, FilterState> genderFilterList() {
    return BlocBuilder<FilterBloc, FilterState>(
        bloc: filterBloc,
        builder: (context, filterState) {
          var genders = filterState.filters
              ?.where((element) => element.type == FilterType.GENDER);
          return filterState.listingStatus == FilterListStatus.loading
              ? Container(
                  color: kWhite,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: kPrimaryColor,
                    ),
                  ),
                )
              : Container(
                  color: kWhite,
                  height: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                        children: genders?.map((e) {
                              return Column(
                                children: [
                                  Card(
                                    child: ListTile(
                                      onTap: () => setState(() {
                                        selectedGenderId = e.id;
                                      }),
                                      leading: Icon(
                                        Icons.check,
                                        color: selectedGenderId == e.id
                                            ? kPrimaryColor
                                            : kScaffoldBgColor,
                                      ),
                                      title: Text(
                                        '${e.name_tm}',
                                        style: TextStyle(color: kText2Color),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }).toList() ??
                            []),
                  ),
                );
        });
  }

  // Widget buildBody() {
  //   switch (selectedIndex) {
  //     case 0:
  //       return Container(
  //         color: kWhite,
  //         child: Column(
  //           children: widget.filters?.colors?.map((e) {
  //                 return Column(
  //                   children: [
  //                     ListTile(
  //                       leading: Icon(Icons.check, color: kScaffoldBgColor),
  //                       title: Text(
  //                         '${e.name_tm}',
  //                         style: TextStyle(color: kPrimaryColor),
  //                       ),
  //                     ),
  //                     Divider(
  //                       indent: 15,
  //                       endIndent: 15,
  //                       color: kScaffoldBgColor,
  //                       height: .5,
  //                       thickness: 1,
  //                     )
  //                   ],
  //                 );
  //               }).toList() ??
  //               [
  //                 ListTile(
  //                   title: Text('data bosh gelya...'),
  //                 )
  //               ],
  //         ),
  //       );
  //     case 1:
  //       return Container(
  //         color: kWhite,
  //         width: double.infinity,
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: widget.filters?.sizes?.map((e) {
  //                 return Column(
  //                   children: [
  //                     ListTile(
  //                       leading: Icon(Icons.check, color: kScaffoldBgColor),
  //                       title: Text(
  //                         '${e.name_tm}',
  //                         style: TextStyle(color: kPrimaryColor),
  //                       ),
  //                     ),
  //                     Divider(
  //                       indent: 15,
  //                       endIndent: 15,
  //                       color: kScaffoldBgColor,
  //                       height: .5,
  //                       thickness: 1,
  //                     )
  //                   ],
  //                 );
  //               }).toList() ??
  //               [
  //                 ListTile(
  //                   title: Text('Boshhhh'),
  //                 )
  //               ],
  //         ),
  //       );
  //     default:
  //       return SizedBox();
  //   }
  // }
}
